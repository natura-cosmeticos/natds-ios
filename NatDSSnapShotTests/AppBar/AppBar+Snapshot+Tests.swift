import XCTest
import SnapshotTesting

@testable import NatDS

class AppBarSnapshotTests: XCTestCase {
    var systemUnderTest: UINavigationController!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = UINavigationController(rootViewController: UIViewController())
    }

    func test_appbar_style_default_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_style_default_logo_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)
        systemUnderTest.visibleViewController?.configure(titleStyle: .logo)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_appbar_style_default_title_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)
        systemUnderTest.visibleViewController?.configure(titleStyle: .title("New Title"))

        assertSnapshot(matching: systemUnderTest, as: .image(precision: 0.97))
    }

    func test_appbar_style_default_rightbuttons_hasValidSnapshot() {
        systemUnderTest.configure(style: .default)

        let barButtonItem = UIBarButtonItem(
            icon: nil,
            action: nil,
            target: nil
        )
        let barButtonItemWithBadge = UIBarButtonItem(
            icon: nil,
            action: nil,
            target: nil
        )

        barButtonItemWithBadge.setBadgeValue(99)
        systemUnderTest.visibleViewController?.configure(buttons: [barButtonItemWithBadge, barButtonItem])

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
