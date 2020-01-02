import XCTest
@testable import NatDS

class FontsNaturaTests: XCTestCase {

    func test_h6_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        let font = FontsNatura.h6

        XCTAssertEqual(font, expectedFont)
    }

    func test_body2_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        let font = FontsNatura.body2

        XCTAssertEqual(font, expectedFont)
    }

    func test_button_returnsExpectedFont() {
        let expectedFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        let font = FontsNatura.button

        XCTAssertEqual(font, expectedFont)
    }

}
