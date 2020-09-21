import XCTest
import SnapshotTesting

@testable import NatDS

final class NatTagSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_tag_style_default_alert_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "New")

        assertSnapshot(matching: sut, as: .image)
    }
}
