import XCTest
@testable import NatDS

final class TabTests: XCTestCase {
    var systemUnderTest: Tab!
    var superView: UIView!

    var delegateMock: TabDelegateMock!

    override func setUp() {
        super.setUp()

        delegateMock = TabDelegateMock()

        superView = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 60))
        superView.backgroundColor = .white

        systemUnderTest = Tab()
        systemUnderTest.delegate = delegateMock
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 328, height: 48)

        superView.addSubview(systemUnderTest)
    }

    func test_selectedSegmentedIndex_whenIndexNotExistInTabs_returnsSelectedSegmentedIndexAs0() {
        systemUnderTest.insertTab(title: "Tab 1")
        systemUnderTest.insertTab(title: "Tab 2")
        systemUnderTest.insertTab(title: "Tab 3")
        systemUnderTest.selectedSegmentedIndex = 100

        XCTAssertEqual(systemUnderTest.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenIndexNotExistInTabsAndTabsIsEmpty_returnsSelectedSegmentedIndexAs0() {
        systemUnderTest.selectedSegmentedIndex = 100

        XCTAssertEqual(systemUnderTest.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenIndexIsNegativeValueAndTabsIsEmpty_returnsSelectedSegmentedIndexAs0() {
        systemUnderTest.selectedSegmentedIndex = -1

        XCTAssertEqual(systemUnderTest.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenIndexIsNegativeValue_returnsSelectedSegmentedIndexAs0() {
        systemUnderTest.insertTab(title: "Tab 1")
        systemUnderTest.insertTab(title: "Tab 2")
        systemUnderTest.insertTab(title: "Tab 3")
        systemUnderTest.selectedSegmentedIndex = -1

        XCTAssertEqual(systemUnderTest.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenHasDelegate_returnSelectedSegmentedIndexAndCallOnce() {
        systemUnderTest.insertTab(title: "Tab 1")
        systemUnderTest.insertTab(title: "Tab 2")

        let expectIndex = 1

        systemUnderTest.selectedSegmentedIndex = expectIndex

        XCTAssertEqual(delegateMock.invokedDidChangeSelectedSegmented.count, 1)
        XCTAssertEqual(delegateMock.invokedDidChangeSelectedSegmented.index, expectIndex)
    }

    func test_didTapTabItem_whenImplementsTabItemViewDelegate_returnsSelectedSegmentedIndexTapped() {
        let expectIndex = 1

        systemUnderTest.insertTab(title: "Tab 1")
        systemUnderTest.insertTab(title: "Tab 2")

        systemUnderTest.didTapTabItem(systemUnderTest.tabs[1])

        XCTAssertEqual(systemUnderTest.selectedSegmentedIndex, expectIndex)
    }
}
