import FBSnapshotTestCase
@testable import NatDS

class TabTests: FBSnapshotTestCase {

    var sut: Tab!
    var superView: UIView!

    var delegateSpy: TabDelegateSpy!

    override func setUp() {
        super.setUp()

        delegateSpy = TabDelegateSpy()

        superView = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 60))
        superView.backgroundColor = .white

        sut = Tab()
        sut.delegate = delegateSpy
        sut.backgroundColor = .white
        sut.frame = CGRect(x: 0, y: 0, width: 328, height: 48)

        superView.addSubview(sut)
    }

    func test_tab_init_whenHas3Tabs_returnsTabWith3TabItemViewsValidSnapshot() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")
        sut.insertTab(title: "Tab 3")

        FBSnapshotVerifyView(superView)
    }

    func test_tab_whenHas2TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")

        sut.selectedSegmentedIndex = 1

        FBSnapshotVerifyView(superView)
    }

    func test_tab_whenHas3TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")
        sut.insertTab(title: "Tab 3")

        sut.selectedSegmentedIndex = 1

        FBSnapshotVerifyView(superView)
    }

    func test_selectedSegmentedIndex_whenIndexNotExistInTabs_returnsSelectedSegmentedIndexAs0() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")
        sut.insertTab(title: "Tab 3")
        sut.selectedSegmentedIndex = 100

        XCTAssertEqual(sut.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenIndexNotExistInTabsAndTabsIsEmpty_returnsSelectedSegmentedIndexAs0() {
        sut.selectedSegmentedIndex = 100

        XCTAssertEqual(sut.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenIndexIsNegativeValueAndTabsIsEmpty_returnsSelectedSegmentedIndexAs0() {
        sut.selectedSegmentedIndex = -1

        XCTAssertEqual(sut.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenIndexIsNegativeValue_returnsSelectedSegmentedIndexAs0() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")
        sut.insertTab(title: "Tab 3")
        sut.selectedSegmentedIndex = -1

        XCTAssertEqual(sut.selectedSegmentedIndex, 0)
    }

    func test_selectedSegmentedIndex_whenHasDelegate_returnSelectedSegmentedIndexAndCallOnce() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")

        let expectIndex = 1

        sut.selectedSegmentedIndex = expectIndex

        XCTAssertEqual(delegateSpy.selectedIndex, expectIndex)
        XCTAssertEqual(delegateSpy.callDidChangeSelectedSegmented, 1)
    }

    func test_didTapTabItemAt_whenImplementsTabItemViewDelegate_returnsSelectedSegmentedIndexAsIndexTapped() {
        let expectIndex = 1

        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")

        sut.didTapTabItemAt(index: expectIndex)

        XCTAssertEqual(sut.selectedSegmentedIndex, expectIndex)
    }
}
