@testable import NatDS

class TabItemViewDelegateMock: TabItemViewDelegate {

    var invokedDidTapItem: (count: Int, tabItem: TabItemView?)

    init() {
        invokedDidTapItem = (count: 0, tabItem: nil)
    }

    func didTapTabItem(_ tabItemView: TabItemView) {
        invokedDidTapItem.count += 1
        invokedDidTapItem.tabItem = tabItemView
    }
}
