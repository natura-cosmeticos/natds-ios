import XCTest
import SnapshotTesting

@testable import NatDS

final class NatButtonSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_icon_right_side_hasValidSnapshot() {
        let systemUnderTest = NatButton(style: .contained)
        systemUnderTest.configure(title: "stub")
        systemUnderTest.configure(icon: .outlinedDefaultMockup, position: .right)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_icon_left_side_hasValidSnapshot() {
        let systemUnderTest = NatButton(style: .contained)
        systemUnderTest.configure(title: "stub")
        systemUnderTest.configure(icon: .outlinedDefaultMockup, position: .left)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }
}

extension NatButtonSnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),

            systemUnderTest.heightAnchor.constraint(equalToConstant: 40),
            systemUnderTest.widthAnchor.constraint(equalToConstant: 80)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
