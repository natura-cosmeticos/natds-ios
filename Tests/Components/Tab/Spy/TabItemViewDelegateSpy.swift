@testable import NatDS

class TabItemViewDelegateSpy: TabItemViewDelegate {

    var selectedTabItem: TabItemView?
    var callDidTapTabItemAt = 0

    func didTapTabItem(_ tabItemView: TabItemView) {
        selectedTabItem = tabItemView
        callDidTapTabItemAt += 1
    }
}
