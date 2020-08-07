import XCTest
import SnapshotTesting

@testable import NatDS

final class NavigationDrawerSubitemCellSnapshotTests: XCTestCase {
    var systemUnderTest: NavigationDrawerSubitemCell!

    override func setUp() {
        super.setUp()
        systemUnderTest = NavigationDrawerSubitemCell()
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
        systemUnderTest.title = "Sub Menu Item"
    }

    func test_normalState_hasNormalSnapshot() {
        systemUnderTest.state = .normal

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_selectedState_hasSnapshotWithHighlightedView() {
        systemUnderTest.state = .selected

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_disabledState_hasSnapshotWithAlphaText() {
        systemUnderTest.state = .disabled

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
