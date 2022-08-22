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

        superView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 60))
        superView.backgroundColor = .white

        systemUnderTest = Tab()
        systemUnderTest.delegate = delegateMock
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 375, height: 48)

        superView.addSubview(systemUnderTest)
    }

    func test_InitWhenHas3TabsreturnsTabWith3TabItemViewsValidSnapshot() {
        systemUnderTest.insertTab(title: "AVON")
        systemUnderTest.insertTab(title: "THE BODY SHOP")
        systemUnderTest.insertTab(title: "AĒSOP")

        assertSnapshot(matching: superView, as: .image(precision: 0.95))
    }

    func test_whenHas2TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        systemUnderTest.insertTab(title: "AVON")
        systemUnderTest.insertTab(title: "THE BODY SHOP")
        systemUnderTest.selectedSegmentedIndex = 1

        assertSnapshot(matching: superView, as: .image(precision: 0.95))
    }

    func test_whenHas3TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        systemUnderTest.insertTab(title: "AVON")
        systemUnderTest.insertTab(title: "THE BODY SHOP")
        systemUnderTest.insertTab(title: "AĒSOP")
        systemUnderTest.selectedSegmentedIndex = 1

        assertSnapshot(matching: superView, as: .image(precision: 0.95))
    }

    func test_whenSetsPositionScrollableAndSelectedFirstTabValidSnapshot() {
        systemUnderTest.insertTab(title: "AVON")
        systemUnderTest.insertTab(title: "THE BODY SHOP")
        systemUnderTest.insertTab(title: "AĒSOP")
        systemUnderTest.insertTab(title: "NATURA")
        systemUnderTest.insertTab(title: "NATURA&CO")
        systemUnderTest.configure(position: .scrollable)
        systemUnderTest.selectedSegmentedIndex = 0

        assertSnapshot(matching: superView, as: .image(precision: 0.95))
    }

    func test_whenSetsPositionScrollableAndSelected4tTabValidSnapshot() {
        systemUnderTest.insertTab(title: "AVON")
        systemUnderTest.insertTab(title: "THE BODY SHOP")
        systemUnderTest.insertTab(title: "AĒSOP")
        systemUnderTest.insertTab(title: "NATURA")
        systemUnderTest.insertTab(title: "NATURA&CO")
        systemUnderTest.configure(position: .scrollable)
        systemUnderTest.selectedSegmentedIndex = 3
        assertSnapshot(matching: superView, as: .image(precision: 0.95))
    }

    func test_whenSetsPositionFixedAndNotSelectIndexValidSnapshot() {
        systemUnderTest.insertTab(title: "AVON")
        systemUnderTest.insertTab(title: "THE BODY SHOP")
        systemUnderTest.insertTab(title: "AĒSOP")
        systemUnderTest.configure(position: .fixed)

        assertSnapshot(matching: superView, as: .image(precision: 0.95))
    }

    func test_whenSetsPositionScrollableAndNotSelectIndexValidSnapshot() {
        systemUnderTest.insertTab(title: "AVON")
        systemUnderTest.insertTab(title: "THE BODY SHOP")
        systemUnderTest.insertTab(title: "AĒSOP")
        systemUnderTest.insertTab(title: "NATURA")
        systemUnderTest.insertTab(title: "NATURA&CO")
        systemUnderTest.configure(position: .scrollable)

        assertSnapshot(matching: superView, as: .image(precision: 0.95))
    }
}
