import XCTest
import SnapshotTesting

@testable import NatDS

final class DividerSnapshotTests: XCTestCase {
    var systemUnderTest: Divider!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        DesignSystem().configure(with: .natura)

        systemUnderTest = Divider()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 3))
        superview.backgroundColor = .white
        superview.addSubview(systemUnderTest)

        let constraints = [
            systemUnderTest.topAnchor.constraint(equalTo: superview.topAnchor, constant: 1),
            systemUnderTest.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            systemUnderTest.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func test_init_hasValidSnapshot() {
        assertSnapshot(matching: superview, as: .image)
    }
}
