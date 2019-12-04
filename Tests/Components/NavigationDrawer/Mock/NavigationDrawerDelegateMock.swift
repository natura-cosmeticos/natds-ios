@testable import NatDS

class NavigationDrawerDelegateMock: NavigationDrawerDelegate {
    var numberOfSubitems = 2

    var invokedNumberOfItems = 0
    var invokedNumberOfSubitems: (count: Int, parameters: [Int])
    var invokedDidSelectItem: (count: Int, parameters: [Int])
    var invokedDidSelectSubitem: (count: Int, parameters: [NavigationDrawer.IndexMenu])
    var invokedConfigureItem: (count: Int, parameters: [(item: UITableViewCell, index: Int)])
    var invokedConfigureSubitem: (count: Int, parameters: [(item: UITableViewCell, index: NavigationDrawer.IndexMenu)])

    init() {
        invokedNumberOfSubitems = (0, [])
        invokedDidSelectItem = (0, [])
        invokedDidSelectSubitem = (0, [])
        invokedConfigureItem = (0, [])
        invokedConfigureSubitem = (0, [])
    }

    func numberOfItems() -> Int {
        invokedNumberOfItems += 1
        return 1
    }

    func numberOfSubitems(at item: Int) -> Int {
        invokedNumberOfSubitems.count += 1
        invokedNumberOfSubitems.parameters.append(item)
        return numberOfSubitems
    }

    func didSelectItem(_ item: Int) {
        invokedDidSelectItem.count += 1
        invokedDidSelectItem.parameters.append(item)
    }

    func didSelectSubitem(_ index: NavigationDrawer.IndexMenu) {
        invokedDidSelectSubitem.count += 1
        invokedDidSelectSubitem.parameters.append(index)
    }

    func configureItem(_ item: UITableViewCell, at index: Int) {
        invokedConfigureItem.count += 1
        invokedConfigureItem.parameters.append((item, index))
    }

    func configureSubitem(_ item: UITableViewCell, at index: NavigationDrawer.IndexMenu) {
        invokedConfigureSubitem.count += 1
        invokedConfigureSubitem.parameters.append((item, index))
    }
}
