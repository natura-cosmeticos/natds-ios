public protocol NavigationDrawerDelegate: AnyObject {
    func numberOfItems() -> Int
    func numberOfSubitems(in item: Int) -> Int
    func didSelectItem(at index: Int)
    func didSelectSubitem(at index: NavigationDrawer.IndexMenu)
    func configureItem(_ item: NavigationDrawerItemCell, at index: Int)
    func configureSubitem(_ subitem: NavigationDrawerSubitemCell, at index: NavigationDrawer.IndexMenu)
}

public class NavigationDrawer: UIView {
    public weak var delegate: NavigationDrawerDelegate?

    private var expandedItems: Set<Int> = []
    private var tableView: UITableView

    public init(tableView: UITableView = UITableView()) {
        self.tableView = tableView
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        tableView.register(NavigationDrawerItemCell.self)
        tableView.register(NavigationDrawerSubitemCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 48.0
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self

        addTableView()
    }

    private func addTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }

    private func isExpanded(item: Int) -> Bool {
        return expandedItems.contains(item)
    }

    private func isItem(at indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }

    private func toggleExpandedItem(_ item: Int) {
        if isExpanded(item: item) {
            expandedItems.remove(item)
        } else {
            expandedItems.insert(item)
        }
    }

    private func hasSubitems(in item: Int) -> Bool {
        let numberOfSubitems = delegate?.numberOfSubitems(in: item) ?? 0
        return numberOfSubitems > 0
    }

    private func buildIndexExcludingItem(from indexPath: IndexPath) -> IndexMenu {
        let numberOfItemInSection = 1
        let item = indexPath.section
        let subitem = indexPath.row - numberOfItemInSection
        return IndexMenu(item: item, subitem: subitem)
    }
}

extension NavigationDrawer: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfItems() ?? 0
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsForCollapsedItem = 1
        if isExpanded(item: section) {
            let numberOfSubitems = delegate?.numberOfSubitems(in: section) ?? 0
            return numberOfSubitems + numberOfRowsForCollapsedItem
        }
        return numberOfRowsForCollapsedItem
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isItem(at: indexPath) {
            let cell: NavigationDrawerItemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.hasSubItems = hasSubitems(in: indexPath.section)
            cell.state = isExpanded(item: indexPath.section) ? .selected : .normal
            delegate?.configureItem(cell, at: indexPath.section)
            return cell
        } else {
            let indexMenu = buildIndexExcludingItem(from: indexPath)

            let cell: NavigationDrawerSubitemCell = tableView.dequeueReusableCell(for: indexPath)
            delegate?.configureSubitem(cell, at: indexMenu)
            return cell
        }
    }
}

extension NavigationDrawer: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }
        guard isItem(at: indexPath) else {
            let indexMenu = buildIndexExcludingItem(from: indexPath)
            delegate.didSelectSubitem(at: indexMenu)
            return
        }

        if hasSubitems(in: indexPath.section) {
            toggleExpandedItem(indexPath.section)

            let indexSet = IndexSet(integer: indexPath.section)
            tableView.reloadSections(indexSet, with: .none)
        } else {
            delegate.didSelectItem(at: indexPath.section)
        }
    }
}
