import XCTest
import SnapshotTesting

@testable import NatDS

final class NatBadgeDotSnapshotTests: XCTestCase {
    var systemUnderTest: NatBadge!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = NatBadge(style: .dot, color: .alert)
    }

    func test_badge_style_dot_alert_hasValidSnapshot() {
        systemUnderTest.configureDot()

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.97))
    }
}
