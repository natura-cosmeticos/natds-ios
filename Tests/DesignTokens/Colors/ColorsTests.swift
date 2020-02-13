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

    func test_highEmphasis_returnsExpectedColor() {
        let expectedColor = ColorsNatura.PB.gray
        let color = Colors.highEmphasis

        XCTAssertEqual(color, expectedColor)
    }

    func test_lowEmphasis_returnsExpectedColor() {
        let expectedColor = ColorsNatura.PB.gray2
        let color = Colors.lowEmphasis

        XCTAssertEqual(color, expectedColor)
    }

    func test_surfaceDark_returnsExpectedColor() {
        let expectedColor = ColorsNatura.PB.gray3
        let color = Colors.surfaceDark

        XCTAssertEqual(color, expectedColor)
    }

    func test_highlight_returnsExpectedColor() {
        let expectedColor = ColorsNatura.PB.black
        let color = Colors.highlight

        XCTAssertEqual(color, expectedColor)
    }

    func test_content_whenIsMediumEmphasis_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Content.mediumEmphasis
        let color = Colors.Content.mediumEmphasis

        XCTAssertEqual(color, expectedColor)
    }
}
