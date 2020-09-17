import XCTest
import SnapshotTesting

@testable import NatDS

final class TabSnapshotTests: XCTestCase {
    var systemUnderTest: Tab!
    var superView: UIView!

    var delegateMock: TabDelegateMock!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = NaturaLightTheme()

        delegateMock = TabDelegateMock()

        superView = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 60))
        superView.backgroundColor = .white

        systemUnderTest = Tab()
        systemUnderTest.delegate = delegateMock
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 328, height: 48)

        superView.addSubview(systemUnderTest)
    }

    func test_init_whenHas3Tabs_returnsTabWith3TabItemViewsValidSnapshot() {
        systemUnderTest.insertTab(title: "Tab 1")
        systemUnderTest.insertTab(title: "Tab 2")
        systemUnderTest.insertTab(title: "Tab 3")

        assertSnapshot(matching: superView, as: .image)
    }

    func test_whenHas2TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        systemUnderTest.insertTab(title: "Tab 1")
        systemUnderTest.insertTab(title: "Tab 2")

        systemUnderTest.selectedSegmentedIndex = 1

        assertSnapshot(matching: superView, as: .image)
    }

    func test_whenHas3TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        systemUnderTest.insertTab(title: "Tab 1")
        systemUnderTest.insertTab(title: "Tab 2")
        systemUnderTest.insertTab(title: "Tab 3")

        systemUnderTest.selectedSegmentedIndex = 1

        assertSnapshot(matching: superView, as: .image)
    }
}
