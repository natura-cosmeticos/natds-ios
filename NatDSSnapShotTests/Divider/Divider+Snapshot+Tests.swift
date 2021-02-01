import XCTest
import SnapshotTesting

@testable import NatDS

final class DividerSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
    }

    func test_divider_full_bleed_hasValidSnapshot() {
        let systemUnderTest = Divider()
        systemUnderTest.configure(style: .fullBleed)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_divider_full_middle_hasValidSnapshot() {
        let systemUnderTest = Divider()
        systemUnderTest.configure(style: .middle)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    func test_divider_full_inset_hasValidSnapshot() {
        let systemUnderTest = Divider()
        systemUnderTest.configure(style: .inset)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .image)
    }

    private func addConstraints(_ systemUnderTest: UIView) {

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            systemUnderTest.leadingAnchor.constraint(equalTo: superview.leadingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
