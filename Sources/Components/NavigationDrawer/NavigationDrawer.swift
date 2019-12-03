public protocol NavigationDrawerDelegate: AnyObject {
    func numberOfItems() -> Int
    func numberOfSubitems(at item: Int) -> Int
    func didSelectItem(_ item: Int)
}

public class NavigationDrawer: UITableView {
    public weak var navigationDrawerDelegate: NavigationDrawerDelegate?

    private let cellID = "cellID"
    private var expandedItems: Set<Int> = []

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 48.0
        separatorStyle = .none
        dataSource = self
        delegate = self
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
        return navigationDrawerDelegate?.numberOfItems() ?? 0
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsForCollapsedItem = 1
        if isExpanded(item: section) {
            let numberOfSubitems = navigationDrawerDelegate?.numberOfSubitems(at: section) ?? 0
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
        guard let delegate = navigationDrawerDelegate else { return }

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
