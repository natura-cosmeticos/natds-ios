import XCTest
import SnapshotTesting

@testable import NatDS

final class NatAvatarSnapshotTests: XCTestCase {
    var superview: UIView!
    var systemUnderTest: NatAvatar!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
        systemUnderTest = NatAvatar(size: .medium)
    }

    func test_avatar_initials_hasValidSnapsht() {
        systemUnderTest.configure(name: "Natura Design System")
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_avatar_icon_hasValidSnapshot() {
        systemUnderTest.configureWithDefaultIcon()
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_avatar_image_hasValidSnapshot() {
        systemUnderTest.configure(image: UIImage())
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }

    func test_avatar_nil_image_hasValidSnapshot() {
        systemUnderTest.configure(image: nil)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
        assertSnapshot(matching: systemUnderTest, as: .recursiveDescription)
    }
}

extension NatAvatarSnapshotTests {
    private func addConstraints(_ systemUnderTest: UIView) {
        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
