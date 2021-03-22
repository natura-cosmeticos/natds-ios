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
}
