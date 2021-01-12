import XCTest
import SnapshotTesting

@testable import NatDS

class BadgeableSnapshotTests: XCTestCase {
    var superview: UIView!
    var systemUnderTest: Badgeable!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = BadgeableStub()
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        superview.backgroundColor = .white
        superview.addSubview(systemUnderTest)

        let constraints = [
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func test_badge_style_standard_alert_count_100_hasValidSnapshot() {
        systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
        systemUnderTest.setBadge(count: 100)

        assertSnapshot(matching: superview, as: .image(precision: 0.97))
    }

    func test_badge_style_standard_alert_count_1_hasValidSnapshot() {
        systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
        systemUnderTest.setBadge(count: 1)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_badge_style_dot_alert_count_1_hasValidSnapshot() {
        systemUnderTest.configure(badgeStyle: .dot, withColor: .alert)
        systemUnderTest.setBadge(showDot: true)

        assertSnapshot(matching: superview, as: .image)
    }
}
