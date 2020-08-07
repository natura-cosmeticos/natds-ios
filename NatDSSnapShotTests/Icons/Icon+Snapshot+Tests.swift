import XCTest
import SnapshotTesting

@testable import NatDS

final class IconSnapshotTests: XCTestCase {
    func test_icons_hasValidSnapshot() {
        Icon.allCases.forEach { assert(icon: $0) }
    }

    private func assert(icon: Icon) {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        label.font = .iconFont(ofSize: 24)
        label.text = icon.unicode

        let identifier = "\(icon)"

        assertSnapshot(matching: label, as: .image, named: identifier)
    }
}
