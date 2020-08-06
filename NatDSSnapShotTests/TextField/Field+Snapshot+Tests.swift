import XCTest
import SnapshotTesting

@testable import NatDS

final class FieldSnapshotTests: XCTestCase {
    var systemUnderTest: Field!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        systemUnderTest = Field(frame: CGRect(x: 0, y: 0, width: 328, height: 56))
        systemUnderTest.backgroundColor = .white
        systemUnderTest.placeholder = "Placeholder"
    }

    func test_init_hasNormalSnapshot() {
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_boderWidth_whenSetBorderWidth_hasSnapshotWithBorderWidthGreater() {
        systemUnderTest.borderWidth = 4

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_borderColors_whenSetABorder_hasSnapshotWithCustomValue() {
        systemUnderTest.borderColor = .red

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
