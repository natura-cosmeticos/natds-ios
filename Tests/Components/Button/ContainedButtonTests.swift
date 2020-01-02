import FBSnapshotTestCase
@testable import NatDS

class ContainedButtonTests: FBSnapshotTestCase {

    var sut: ContainedButton!

    override func setUp() {
        super.setUp()
        sut = ContainedButton(frame: CGRect(x: 0, y: 0, width: 144, height: 44))
        sut.setTitle("DEFAULT")
    }

    func test_init_hasValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }

}
