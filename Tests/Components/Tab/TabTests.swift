import FBSnapshotTestCase
@testable import NatDS

class TabTests: FBSnapshotTestCase {

    var sut: Tab!
    var superView: UIView!

    override func setUp() {
        super.setUp()

        superView = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 60))
        superView.backgroundColor = .white

        sut = Tab()
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
}
