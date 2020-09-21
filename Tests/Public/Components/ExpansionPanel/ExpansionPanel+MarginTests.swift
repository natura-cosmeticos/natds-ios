import XCTest

@testable import NatDS

class ExpansionPanelMarginTests: XCTestCase {
    let systemUnderTest = ExpansionPanel.Margin.self

    override func setUp() {
        ConfigurationStorage.shared.currentTheme = StubTheme()
    }

    func test_horizontalMargin_expectedSpacing() {
        let expectedSpacing = NatSpacing.small

        XCTAssertEqual(systemUnderTest.horizontalMargin, expectedSpacing)
    }
}
