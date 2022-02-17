import XCTest
@testable import NatDS

class AssetsHelperTests: XCTestCase {

    func test_imageFromInvalidName_returnsNullImage() {
        let image = AssetsHelper.image(from: "")
        XCTAssertNil(image)
    }
}
