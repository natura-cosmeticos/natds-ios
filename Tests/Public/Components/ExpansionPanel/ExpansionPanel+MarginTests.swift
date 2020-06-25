import XCTest
@testable import NatDS

class ExpansionPanelMarginTests: XCTestCase {

    let systemUnderTest = ExpansionPanel.Margin.self

    override func setUp() {
        DesignSystem().configure(with: .natura)
    }

    func test_top_expectedSpacing() {
        let expectedSpacing = NatSpacing.tiny

        XCTAssertEqual(systemUnderTest.top, expectedSpacing)
    }

    func test_left_expectedSpacing() {
        let expectedSpacing = NatSpacing.small

        XCTAssertEqual(systemUnderTest.left, expectedSpacing)
    }

    func test_right_expectedSpacing() {
        let expectedSpacing = NatSpacing.small

        XCTAssertEqual(systemUnderTest.right, expectedSpacing)
    }

}
