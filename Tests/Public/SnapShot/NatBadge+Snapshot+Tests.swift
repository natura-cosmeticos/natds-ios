import FBSnapshotTestCase

@testable import NatDS

class NatBadgeSnapshotTests: FBSnapshotTestCase {
    var superview: UIView!
    var systemUnderTest: NatBadge!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        systemUnderTest = NatBadge(style: .standard, color: .alert)
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 24))
        superview.backgroundColor = .white
        superview.addSubview(systemUnderTest)

        let constraints = [
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func test_badge_style_standard_alert_count_100_hasValidSnapshot() {
        systemUnderTest.configure(count: 100)

        FBSnapshotVerifyView(superview)
    }

    func test_badge_style_standard_alert_count_50_hasValidSnapshot() {
        systemUnderTest.configure(count: 50)

        FBSnapshotVerifyView(superview)
    }

    func test_badge_style_standard_alert_count_1_hasValidSnapshot() {
        systemUnderTest.configure(count: 1)

        FBSnapshotVerifyView(superview)
    }
}
