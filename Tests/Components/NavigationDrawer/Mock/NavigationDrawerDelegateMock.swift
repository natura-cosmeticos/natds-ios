@testable import NatDS

class NavigationDrawerDelegateMock: NavigationDrawerDelegate {
    var mockNumberOfItems = 1
    var mockNumberOfSubitems = 2
    var mockDisabledItemState = false
    var mockDisabledSubitemState = false

    var invokedNumberOfItems = 0
    var invokedNumberOfSubitems: (count: Int, parameters: [Int])
    var invokedDidSelectItem: (count: Int, parameters: [Int])
    var invokedDidSelectSubitem: (count: Int, parameters: [NavigationDrawer.IndexMenu])
    var invokedConfigureItem: (count: Int, parameters: [(item: NavigationDrawerItemCell, index: Int)])
    var invokedConfigureSubitem: (count: Int,
                                  parameters: [(item: NavigationDrawerSubitemCell,
                                                index: NavigationDrawer.IndexMenu)])

    init() {
        invokedNumberOfSubitems = (0, [])
        invokedDidSelectItem = (0, [])
        invokedDidSelectSubitem = (0, [])
        invokedConfigureItem = (0, [])
        invokedConfigureSubitem = (0, [])
    }

    func numberOfItems() -> Int {
        invokedNumberOfItems += 1
        return mockNumberOfItems
    }

    func numberOfSubitems(in item: Int) -> Int {
        invokedNumberOfSubitems.count += 1
        invokedNumberOfSubitems.parameters.append(item)
        return mockNumberOfSubitems
    }

    func didSelectItem(at index: Int) {
        invokedDidSelectItem.count += 1
        invokedDidSelectItem.parameters.append(index)
    }

    func didSelectSubitem(at index: NavigationDrawer.IndexMenu) {
        invokedDidSelectSubitem.count += 1
        invokedDidSelectSubitem.parameters.append(index)
    }

    func configureItem(_ item: NavigationDrawerItemCell, at index: Int) {
        invokedConfigureItem.count += 1
        invokedConfigureItem.parameters.append((item, index))
        item.title = "Item #\(index)"
        if mockDisabledItemState {
            item.state = .disabled
        }
    }

    func configureSubitem(_ subitem: NavigationDrawerSubitemCell, at index: NavigationDrawer.IndexMenu) {
        invokedConfigureSubitem.count += 1
        invokedConfigureSubitem.parameters.append((subitem, index))
        subitem.title = "Subitem #\(index.subitem)"
        if mockDisabledSubitemState {
            subitem.state = .disabled
        }
    }
}
