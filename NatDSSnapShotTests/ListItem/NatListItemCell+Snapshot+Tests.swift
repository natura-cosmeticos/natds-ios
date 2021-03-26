import XCTest
import SnapshotTesting

@testable import NatDS

class CustomCell: NatListItemCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class NatListItemCellSnapshotTests: XCTestCase {
    var systemUnderTest: CustomCell!

    override func setUp() {
        super.setUp()
        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = CustomCell()
    }

    func test_listItem_unselected_hasValidSnapshot() {
        systemUnderTest.isSelected = false

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_listItem_selected_hasValidSnapshot() {
        systemUnderTest.configure(onClick: true)
        systemUnderTest.isSelected = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_listItem_fullbleedDivider_hasValidSnapshot() {
        systemUnderTest.configure(divider: .fullBleed)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_listItem_insetDivider_hasValidSnapshot() {
        systemUnderTest.configure(divider: .inset)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }

    func test_listItem_middleDivider_hasValidSnapshot() {
        systemUnderTest.configure(divider: .middle)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
