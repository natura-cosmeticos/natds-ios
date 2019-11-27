import XCTest
@testable import NatDS

class ColorsTests: XCTestCase {
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

}
