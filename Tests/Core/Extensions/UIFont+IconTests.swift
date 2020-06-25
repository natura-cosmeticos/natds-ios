import XCTest
@testable import NatDS

class UIFontIconTests: XCTestCase {

    func test_iconFont_returnsExpectedFont() {
        let fontStyle = FontIconStyle.standard
        AssetsHelper.loadFont(fontStyle)
        let expectedFont = UIFont(name: fontStyle.name, size: 24)

        let font = UIFont.iconFont(ofSize: 24)

        XCTAssertEqual(font, expectedFont)
    }
}
