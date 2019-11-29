import XCTest
@testable import NatDS

class AssetsHelperTests: XCTestCase {

    func test_imageFromName_returnsNonNullImage() {
        let image = AssetsHelper.image(from: "Outlined/Navigation/ArrowDown")
        XCTAssertNotNil(image)
    }

    func test_imageFromInvalidName_returnsNullImage() {
        let image = AssetsHelper.image(from: "")
        XCTAssertNil(image)
    }

}
