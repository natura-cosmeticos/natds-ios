@testable import NatDS

class TabDelegateSpy: TabDelegate {

    var selectedIndex: Int?
    var callDidChangeSelectedSegmented = 0

    func didChangeSelectedSegmented(index: Int) {
        selectedIndex = index
        callDidChangeSelectedSegmented += 1
    }
}
