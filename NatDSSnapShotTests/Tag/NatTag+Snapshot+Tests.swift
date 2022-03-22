import XCTest
import SnapshotTesting
import NatDSIcons

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
        sut.configure(color: .alert)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_style_left_alert_hasValidSnapshot() {
        let sut = NatTag(style: .leftAlert)
        sut.configure(text: "New")
        sut.configure(color: .alert)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_style_right_alert_hasValidSnapshot() {
        let sut = NatTag(style: .rightAlert)
        sut.configure(text: "New")
        sut.configure(color: .alert)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_size_standard_hasValidSnapshot() {
        let sut = NatTag(style: .rightAlert)
        sut.configure(text: "New")
        sut.configure(color: .alert)
        sut.configure(size: .standard)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_size_small_hasValidSnapshot() {
        let sut = NatTag(style: .rightAlert)
        sut.configure(text: "New")
        sut.configure(color: .alert)
        sut.configure(size: .small)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_fixed_width_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert, color: .alert, text: "New")
        sut.translatesAutoresizingMaskIntoConstraints = false
        sut.widthAnchor.constraint(equalToConstant: 100).isActive = true

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_small_withIcon_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert, color: .alert, icon: getIcon(.outlinedDefaultMockup), text: "New")

        assertSnapshot(matching: sut, as: .image)
    }

    func test_tag_standard_withIcon_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert, color: .alert, size: .standard, icon: getIcon(.outlinedDefaultMockup), text: "New")

        assertSnapshot(matching: sut, as: .image)
    }
}
