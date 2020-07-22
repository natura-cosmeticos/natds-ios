import FBSnapshotTestCase

@testable import NatDS

class AppBarSnapshotTests: FBSnapshotTestCase {
    var window: UIWindow!
    var systemUnderTest: UINavigationController!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        systemUnderTest = UINavigationController(rootViewController: UIViewController())
        window = UIWindow(frame: systemUnderTest.view.frame)

        window.addSubview(systemUnderTest.view)
    }

    func test_appbar_style_default_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)

        FBSnapshotVerifyView(systemUnderTest.view)
    }

    func test_appbar_style_default_logo_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)
        systemUnderTest.visibleViewController?.configure(titleStyle: .logo)

        FBSnapshotVerifyView(systemUnderTest.view)
    }

    func test_appbar_style_default_title_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)
        systemUnderTest.visibleViewController?.configure(titleStyle: .title("New Title"))

        FBSnapshotVerifyView(systemUnderTest.view)
    }

    func test_appbar_style_default_rightbuttons_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)

        let barButtonItem = UIBarButtonItem(icon: .outlinedActionCalendar,
                                            action: nil,
                                            target: nil)
        let barButtonItemWithBadge = UIBarButtonItem(icon: .outlinedAlertNotification,
                                                     action: nil,
                                                     target: nil)
        barButtonItemWithBadge.setBadgeValue(99)

        systemUnderTest.visibleViewController?.configure(buttons: [barButtonItemWithBadge, barButtonItem])

        FBSnapshotVerifyView(systemUnderTest.view)
    }
}
