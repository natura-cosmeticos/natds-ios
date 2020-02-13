import FBSnapshotTestCase
@testable import NatDS

class FieldTests: FBSnapshotTestCase {

    var sut: Field!

    override func setUp() {
        super.setUp()

        sut = Field(frame: CGRect(x: 0, y: 0, width: 328, height: 56))
        sut.backgroundColor = .white
    }

    func test_init_hasNormalSnapshot() {
        sut.placeholder = "Placeholder"
        FBSnapshotVerifyView(sut)
    }

    func test_boderWidth_hasSnapshotWithBorderWidthGreater() {
        sut.placeholder = "Placeholder"
        sut.borderWidth = 4
        FBSnapshotVerifyView(sut)
    }

    func test_borderColor_hasSnapshotWithBorderColorRed() {
        sut.placeholder = "Placeholder"
        sut.borderColor = .red
        FBSnapshotVerifyView(sut)
    }
}
