import XCTest
import SnapshotTesting

@testable import NatDS

final class TabItemSnapshotTests: XCTestCase {
    var systemUnderTest: TabItemView!
    var delegateMock: TabItemViewDelegateMock!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        delegateMock = TabItemViewDelegateMock()

        systemUnderTest = TabItemView(title: "Tab")
        systemUnderTest.delegate = delegateMock
        systemUnderTest.backgroundColor = .white
        systemUnderTest.frame = .init(x: 0, y: 0, width: 120, height: 48)
    }

    func test_state_whenIsSelected_returnsSelectedSnapshot() {
        systemUnderTest.state = .selected

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_state_whenIsNormal_returnsNormalSnapshot() {
        systemUnderTest.state = .normal

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
