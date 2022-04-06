import XCTest
import SnapshotTesting

@testable import NatDS

final class ValueTextHighlightSnapshotTests: XCTestCase {
    var systemUnderTest: ValueTextHighlight!
    var superview: UIView!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = ValueTextHighlight(frame: CGRect(x: 0, y: 10, width: 328, height: 80))
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 100))
        superview.backgroundColor = .white
        superview.addSubview(systemUnderTest)
    }

    func test_init_hasValidSnapshot() {
        systemUnderTest.valueDescription = "You are transferring"
        systemUnderTest.value = "$ 43,00"

        assertSnapshot(matching: superview, as: .image(precision: 0.99))
    }
}
