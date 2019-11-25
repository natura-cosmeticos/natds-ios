import XCTest
@testable import NatDS

class ColorsTests: XCTestCase {
    func test_primary_returnsExpectedColor() {
        let expectedColor = ColorsNatura.Primary.orange
        let color = Colors.primary

        XCTAssertEqual(color, expectedColor)
    }

    func test_highEmphasis_returnsExpectedColor() {
        let expectedColor = ColorsNatura.PB.gray
        let color = Colors.highEmphasis

        XCTAssertEqual(color, expectedColor)
    }

    func test_surfaceDark_returnsExpectedColor() {
        let expectedColor = ColorsNatura.PB.gray3
        let color = Colors.surfaceDark

        XCTAssertEqual(color, expectedColor)
    }

}
