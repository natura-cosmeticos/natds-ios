import XCTest
@testable import NatDS

class UIColorHexTests: XCTestCase {
    func test_init_withSixCharacters_returnsExpectedColor() {
        let expectedColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        let color = UIColor(hex: "#000000")

        XCTAssertEqual(color, expectedColor)
    }

    func test_init_lessThanSixCharacters_returnsNil() {
        let color = UIColor(hex: "#0000")

        XCTAssertNil(color)
    }

    func test_init_greaterThanSixCharacters_returnsNil() {
        let color = UIColor(hex: "#0000000")

        XCTAssertNil(color)
    }

    func test_hexColorOrDefault_withValidHexColor_returnsExpectedColor() {
        let expectedColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let color = UIColor.hexColorOrDefault("#FFFFFF")

        XCTAssertEqual(color, expectedColor)
    }

    func test_hexColorOrDefault_withInvalidHexColor_returnsDefaultColor() {
        let defaultColor = UIColor.black
        let color = UIColor.hexColorOrDefault("#")

        XCTAssertEqual(color, defaultColor)
    }
}
