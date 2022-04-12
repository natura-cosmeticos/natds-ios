import XCTest

@testable import NatDS

class IllustrationIconsTests: XCTestCase {
    func test_illustrationLinedSad_returnsExpectedImage() {
        let expectedImage = AssetsHelper.image(from: "Illustration/Lined/Sad")
        let image = IllustrationIcons.Lined.sad

        XCTAssertEqual(image, expectedImage)
        XCTAssertNotNil(image)
    }
}
