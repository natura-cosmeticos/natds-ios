import XCTest
import SnapshotTesting

@testable import NatDS

final class NatTagSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 100))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_tag_style_default_alert_hasValidSnapshot() {
        let sut = NatTag(style: .defaultAlert)
        sut.configure(text: "Novo")

        superview.addSubview(sut)

        assertSnapshot(matching: superview, as: .image)
    }
}
