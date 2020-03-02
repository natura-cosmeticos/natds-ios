import XCTest
@testable import NatDS

class ColorsTests: XCTestCase {
    func test_primary_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Primary.yellow
        let color = Colors.primary

        XCTAssertEqual(color, expectedColor)
    }

    func test_secondary_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Primary.orange
        let color = Colors.secondary

        XCTAssertEqual(color, expectedColor)
    }

    func test_surfaceDark_returnsExpectedColor() {
        let expectedColor = ColorsNatura.PB.gray3
        let color = Colors.surfaceDark

        XCTAssertEqual(color, expectedColor)
    }

    func test_content_whenIsHighlight_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Content.highlight
        let color = Colors.Content.highlight

        XCTAssertEqual(color, expectedColor)
    }

    func test_content_whenIsHighEmphasis_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Content.highEmphasis
        let color = Colors.Content.highEmphasis

        XCTAssertEqual(color, expectedColor)
    }

    func test_content_whenIsMediumEmphasis_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Content.mediumEmphasis
        let color = Colors.Content.mediumEmphasis

        XCTAssertEqual(color, expectedColor)
    }

    func test_feedback_whenIsAlert_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Feedback.alert
        let color = Colors.Feedback.alert

        XCTAssertEqual(color, expectedColor)
    }
}
