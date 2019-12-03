public protocol NavigationDrawerDelegate: AnyObject {
    func numberOfItems() -> Int
    func numberOfSubitems(at item: Int) -> Int
    func didSelectItem(_ item: Int)
}

public class NavigationDrawer: UIView {
    public weak var delegate: NavigationDrawerDelegate?

    private let cellID = "cellID"
    private var expandedItems: Set<Int> = []

    private var tableView: UITableView

    init(tableView: UITableView = UITableView()) {
        self.tableView = tableView
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
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

    private func toggleExpandedItem(_ item: Int) {
        if isExpanded(item: item) {
            expandedItems.remove(item)
        } else {
            expandedItems.insert(item)
        }
    }
}

extension NavigationDrawer: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfItems() ?? 0
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsForCollapsedItem = 1
        if isExpanded(item: section) {
            let numberOfSubitems = delegate?.numberOfSubitems(at: section) ?? 0
            return numberOfSubitems + numberOfRowsForCollapsedItem
        }
        return numberOfRowsForCollapsedItem
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension NavigationDrawer: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }

        let numberOfSubitems = delegate.numberOfSubitems(at: indexPath.section)
        if numberOfSubitems > 0 {
            toggleExpandedItem(indexPath.section)

            let indexSet = IndexSet(integer: indexPath.section)
            tableView.reloadSections(indexSet, with: .automatic)
        } else {
            delegate.didSelectItem(indexPath.section)
        }
    }
}
