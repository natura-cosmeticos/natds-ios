import XCTest
import SnapshotTesting

@testable import NatDS

final class SearchBarSnapshotTests: XCTestCase {
    var superview: UIView!
    var systemUnderTest: SearchBar!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = SearchBar()
        systemUnderTest.backgroundColor = .white
        systemUnderTest.placeholder = "Type some text"

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 112))
        superview.backgroundColor = .white
        superview.addSubview(systemUnderTest)

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            systemUnderTest.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func test_state_whenHasNoFocus_expectPlaceholderMessageWithoutCleanButton() {
        assertSnapshot(matching: superview, as: .image)
    }

    func test_state_whenHasText_expectedCleanButtonIsVisible() {
        systemUnderTest.text = "NAT NATURA"

        assertSnapshot(matching: superview, as: .image)
    }
}
