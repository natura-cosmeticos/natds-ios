import XCTest
import SnapshotTesting

@testable import NatDS

final class IconViewSnapshotTests: XCTestCase {
    var systemUnderTest: IconView!

    override func setUp() {
        super.setUp()
        systemUnderTest = IconView()
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }

    func test_init_hasValidSnapshot() {
        systemUnderTest.shouldShowDefaultIcon = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_tintColor_hasSnapshotWithCustomColor() {
        systemUnderTest.shouldShowDefaultIcon = true
        systemUnderTest.tintColor = .red

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
