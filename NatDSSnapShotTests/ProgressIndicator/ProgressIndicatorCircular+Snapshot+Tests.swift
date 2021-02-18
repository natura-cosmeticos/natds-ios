import XCTest
import SnapshotTesting

@testable import NatDS

final class ProgressIndicatorCircularSnapshotTests: XCTestCase {
    var superview: UIView!

    override func setUp() {
        super.setUp()

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superview.backgroundColor = .white

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
        superview.backgroundColor = getUIColorFromTokens(\.colorBackground)
    }

    func test_progress_indicator_circular_hasValidSnapshot() {
        let systemUnderTest = NatProgressIndicatorCircular()
        systemUnderTest.configure(with: .showAndStartAnimation)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .recursiveDescription)
    }

    func test_progress_indicator_circular_useBackgroundLayer_hasValidSnapshot() {
        let systemUnderTest = NatProgressIndicatorCircular()
        systemUnderTest.configure(with: .showAndStartAnimation)
        systemUnderTest.configure(useBackgroundLayer: true)
        superview.addSubview(systemUnderTest)
        addConstraints(systemUnderTest)

        assertSnapshot(matching: superview, as: .recursiveDescription)
    }

    private func addConstraints(_ systemUnderTest: UIView) {

        systemUnderTest.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            systemUnderTest.topAnchor.constraint(equalTo: superview.topAnchor, constant: 50),
            systemUnderTest.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 50),

            systemUnderTest.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            systemUnderTest.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            systemUnderTest.heightAnchor.constraint(equalToConstant: 100),
            systemUnderTest.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
