import FBSnapshotTestCase
@testable import NatDS

class IconViewTests: FBSnapshotTestCase {

    var sut: IconView!

    override func setUp() {
        super.setUp()
        sut = IconView()
        sut.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }

    func test_init_hasValidSnapshot() {
        sut.icon = .filledActionAdd

        FBSnapshotVerifyView(sut)
    }

    func test_tintColor_hasSnapshotWithCustomColor() {
        sut.icon = .filledActionAdd
        sut.tintColor = .red

        FBSnapshotVerifyView(sut)
    }
}
