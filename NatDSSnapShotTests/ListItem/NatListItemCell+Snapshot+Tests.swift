import XCTest
import SnapshotTesting

@testable import NatDS

final class NatListItemCellSnapshotTests: XCTestCase {
    var systemUnderTest: NatListItemCell!

    override func setUp() {
        super.setUp()
        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        systemUnderTest = NatListItemCell()
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
    }
    
    func test_listItem_unselected_hasValidSnapshot() {
        let systemUnderTest = NatListItemCell()
        systemUnderTest.isSelected = false

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_listItem_selected_hasValidSnapshot() {
        let systemUnderTest = NatListItemCell()
        systemUnderTest.configure(onClick: true)
        systemUnderTest.isSelected = true

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_listItem_fullbleedDivider_hasValidSnapshot() {
        let systemUnderTest = NatListItemCell()
        systemUnderTest.configure(divider: .fullBleed)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_listItem_insetDivider_hasValidSnapshot() {
        let systemUnderTest = NatListItemCell()
        systemUnderTest.configure(divider: .inset)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
    
    func test_listItem_middleDivider_hasValidSnapshot() {
        let systemUnderTest = NatListItemCell()
        systemUnderTest.configure(divider: .middle)

        assertSnapshot(matching: systemUnderTest, as: .image)
    }
}
