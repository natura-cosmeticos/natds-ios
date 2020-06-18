import XCTest
import FBSnapshotTestCase
@testable import NatDS

class ExpansionPanelTests: FBSnapshotTestCase {

    var sut: ExpansionPanel!

    override func setUp() {
        super.setUp()
        sut = ExpansionPanel()
        sut.frame = CGRect(x: 0, y: 0, width: 320, height: 64)
        sut.setSubtitle("Subtitle")
    }

    func test_defaultInit_hasValidSnapshot() {
        recordMode = true
        FBSnapshotVerifyView(sut)
    }

}
