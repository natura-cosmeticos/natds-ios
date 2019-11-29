import XCTest
@testable import NatDS

class OutlinedIconsTests: XCTestCase {

    func test_outlinedNavigationArrowDown_returnsExpectedImage() {
        let expectedImage = AssetsHelper.image(from: "Outlined/Navigation/ArrowDown")
        let image = OutlinedIcons.Navigation.arrowDown

        XCTAssertEqual(image, expectedImage)
        XCTAssertNotNil(image)
    }

}
