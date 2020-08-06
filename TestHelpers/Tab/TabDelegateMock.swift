@testable import NatDS

class TabDelegateMock: TabDelegate {

    var invokedDidChangeSelectedSegmented: (count: Int, index: Int)

    init() {
        invokedDidChangeSelectedSegmented = (count: 0, index: -1)
    }

    func didChangeSelectedSegmented(index: Int) {
        invokedDidChangeSelectedSegmented.count += 1
        invokedDidChangeSelectedSegmented.index = index
    }
}
