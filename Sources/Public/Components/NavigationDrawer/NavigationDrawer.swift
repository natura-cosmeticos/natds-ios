/// A protocol with the delegate methods for navigation drawer configuration
public protocol NavigationDrawerDelegate: AnyObject {
    /// A method to return the number of itens in the Navigation Drawer
    func numberOfItems() -> Int
    /// A method to return the number of subitens of an item in the Navigation Drawer
    /// - Parameter item: the index of the item
    func numberOfSubitems(in item: Int) -> Int
    /// The method that is called when the item is selected
    /// - Parameter index: the index of the selected item
    func didSelectItem(at index: Int)
    /// The method that is called when the subitem is selected
    /// - Parameter index: the index of the subitem
    func didSelectSubitem(at index: NavigationDrawer.IndexMenu)
    /// The method to configure an item at an index in the Navigation Drawer
    /// - Parameters:
    ///   - item: the customized `NavigationDrawerItemCell` for the index
    ///   - index: the index of the item
    func configureItem(_ item: NavigationDrawerItemCell, at index: Int)
    /// The method to configure a subitem at an index in the Navigation Drawer
    /// - Parameters:
    ///   - subitem: the customized `NavigationDrawerSubitemCell` for the index
    ///   - index: the index of the subitem
    func configureSubitem(_ subitem: NavigationDrawerSubitemCell, at index: NavigationDrawer.IndexMenu)
}

/**
 NavigationDrawer is a class that represents a component from the design system.

 The NavigationDrawerSubitem has 3 states:

 - normal
 - disabled
 - selected

 An Item has important properties to configure:

 - label
 - icon
 - disabled
 - tagText
 - subitems

 Use the methods of NavigationDrawerDelegate protocol to manage the following features:

 - numberOfItems
 - numberOfSubitems
 - didSelectItem
 - didSelectSubitem
 - configureItem
 - configureSubitem

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

 DesignSystem().configure(with: AvailableTheme)
 */

public class NavigationDrawer: UIView {
    public weak var delegate: NavigationDrawerDelegate?

    private var expandedItems: Set<Int> = []
    private var isDisabledAtIndexPath = [IndexPath: Bool]()
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

    public func reloadData() {
        tableView.reloadData()
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

    private func isDisabled(indexPath: IndexPath) -> Bool {
        let isDisabled = isDisabledAtIndexPath[indexPath]
        return isDisabled ?? false
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
            isDisabledAtIndexPath[indexPath] = cell.state == .disabled
            return cell
        } else {
            let indexMenu = buildIndexExcludingItem(from: indexPath)

            let cell: NavigationDrawerSubitemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.state = .normal

            delegate?.configureSubitem(cell, at: indexMenu)
            isDisabledAtIndexPath[indexPath] = cell.state == .disabled
            return cell
        }
    }
}

extension NavigationDrawer: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate, !isDisabled(indexPath: indexPath) else { return }
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
