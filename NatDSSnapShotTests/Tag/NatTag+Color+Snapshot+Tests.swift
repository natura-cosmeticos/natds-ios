import XCTest
import SnapshotTesting

@testable import NatDS

final class NatTagColorSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_tag_color_primary_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "New")
        sut.configure(color: .primary)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_color_secondary_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "New")
        sut.configure(color: .secondary)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_color_success_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "New")
        sut.configure(color: .success)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_color_alert_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "New")
        sut.configure(color: .alert)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_color_warning_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "New")
        sut.configure(color: .warning)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_color_link_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "New")
        sut.configure(color: .link)

        assertSnapshot(matching: sut, as: .image)
    }
}
