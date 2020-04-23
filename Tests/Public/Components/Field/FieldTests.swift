import FBSnapshotTestCase
@testable import NatDS

class FieldTests: FBSnapshotTestCase {

    var sut: Field!

    override func setUp() {
        super.setUp()

        sut = Field(frame: CGRect(x: 0, y: 0, width: 328, height: 56))
        sut.backgroundColor = .white
        sut.placeholder = "Placeholder"
    }

    func test_init_hasNormalSnapshot() {
        FBSnapshotVerifyView(sut)
    }

    func test_boderWidth_whenSetBorderWidth_hasSnapshotWithBorderWidthGreater() {
        sut.borderWidth = 4
        FBSnapshotVerifyView(sut)
    }

    func test_borderColors_whenSetABorder_hasSnapshotWithCustomValue() {
        sut.borderColor = .red
        FBSnapshotVerifyView(sut)
    }
}
