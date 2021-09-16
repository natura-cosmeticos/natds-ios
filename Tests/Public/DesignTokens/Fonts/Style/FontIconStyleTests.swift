import XCTest
@testable import NatDS

class FontIconStyleTests: XCTestCase {

    func test_standard_filename_returnsExpectedFilename() {
        let expectedFilename = "natds-icons-ios"
        let sut = IconFontStyle.standard

        XCTAssertEqual(sut.filename, expectedFilename)
    }

    func test_standard_name_returnsExpectedName() {
        let expectedName = "natds-icons"
        let sut = IconFontStyle.standard

        XCTAssertEqual(sut.name, expectedName)
    }

    func test_standard_familyName_returnsExpectedFamilyName() {
        let expectedFamilyName = "natds-icons"
        let sut = IconFontStyle.standard

        XCTAssertEqual(sut.familyName, expectedFamilyName)
    }
}
