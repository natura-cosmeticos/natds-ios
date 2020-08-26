import XCTest
import SnapshotTesting

@testable import NatDS

final class NatBadgeSnapshotTests: XCTestCase {
    var systemUnderTest: NatBadge!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = NatBadge(style: .standard, color: .alert)
    }

    func test_badge_style_standard_alert_count_100_hasValidSnapshot() {
        systemUnderTest.configure(count: 100)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_badge_style_standard_alert_count_50_hasValidSnapshot() {
        systemUnderTest.configure(count: 50)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_badge_style_standard_alert_count_1_hasValidSnapshot() {
        systemUnderTest.configure(count: 1)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
