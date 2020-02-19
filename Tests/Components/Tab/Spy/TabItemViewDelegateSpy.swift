@testable import NatDS

class TabItemViewDelegateSpy: TabItemViewDelegate {

    var selectedIndex: Int?
    var callDidTapTabItemAt = 0

    func didTapTabItemAt(index: Int) {
        selectedIndex = index
        callDidTapTabItemAt += 1
    }
}
