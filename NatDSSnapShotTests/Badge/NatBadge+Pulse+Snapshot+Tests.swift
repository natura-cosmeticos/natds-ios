import XCTest
import SnapshotTesting

@testable import NatDS

final class NatBadgePulseSnapshotTests: XCTestCase {
    var systemUnderTest: NatBadge!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_badge_style_pulse_alert_hasValidSnapshot() {
        systemUnderTest = NatBadge(style: .pulse, color: .alert)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_badge_style_pulse_primary_hasValidSnapshot() {
        systemUnderTest = NatBadge(style: .pulse, color: .primary)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_badge_style_pulse_secondary_hasValidSnapshot() {
        systemUnderTest = NatBadge(style: .pulse, color: .secondary)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_badge_style_pulse_success_hasValidSnapshot() {
        systemUnderTest = NatBadge(style: .pulse, color: .success)
        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
