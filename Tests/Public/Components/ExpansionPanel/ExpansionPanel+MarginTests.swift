import XCTest
@testable import NatDS

class ExpansionPanelMarginTests: XCTestCase {

    let systemUnderTest = ExpansionPanel.Margin.self

    override func setUp() {
        DesignSystem().configure(with: .natura)
    }

    func test_horizontalMargin_expectedSpacing() {
        let expectedSpacing = NatSpacing.small

        XCTAssertEqual(systemUnderTest.horizontalMargin, expectedSpacing)
    }

}
