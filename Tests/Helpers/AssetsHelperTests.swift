import XCTest
@testable import NatDS

class AssetsHelperTests: XCTestCase {

    func test_imageFromName_returnsNonNullImage() {
        let image = AssetsHelper.image(from: "Illustration/Lined/Sad")
        XCTAssertNotNil(image)
    }

    func test_imageFromInvalidName_returnsNullImage() {
        let image = AssetsHelper.image(from: "")
        XCTAssertNil(image)
    }

    func test_loadFont_whenIsFontIconStyle_loadFontSuccessfully() {
        let iconsFont = FontIconStyle.standard
        AssetsHelper.loadFont(iconsFont)

        let font = UIFont(name: iconsFont.name, size: 24)
        XCTAssertEqual(font?.fontName, iconsFont.name)
        XCTAssertEqual(font?.familyName, iconsFont.familyName)
    }
}
