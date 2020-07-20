import FBSnapshotTestCase

@testable import NatDS

class BadgeableSnapshotTests: FBSnapshotTestCase {
    var superview: UIView!
    var systemUnderTest: Badgeable!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

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

        FBSnapshotVerifyView(superview)
    }

    func test_badge_style_standard_alert_count_1_hasValidSnapshot() {
        systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
        systemUnderTest.setBadge(count: 1)

        FBSnapshotVerifyView(superview)
    }
}
