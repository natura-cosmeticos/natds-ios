import FBSnapshotTestCase
@testable import NatDS

class TabTests: FBSnapshotTestCase {

    var sut: Tab!

    override func setUp() {
        super.setUp()

        let frame = CGRect(x: 0, y: 0, width: 328, height: 48)

        sut = Tab()
        sut.frame = frame
        sut.backgroundColor = .white

        //recordMode = true
    }

    func test_tab_init_whenHas3Tabs_returnsTabWith3TabItemViewsValidSnapshot() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")
        sut.insertTab(title: "Tab 3")

        FBSnapshotVerifyView(sut)
    }

    func test_tab_whenHas2TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")

        sut.selectedIndex = 1

        FBSnapshotVerifyView(sut)
    }

    func test_tab_whenHas3TabsAndSelectedTabIs2_returnsTabWith2SelectedValidSnapshot() {
        sut.insertTab(title: "Tab 1")
        sut.insertTab(title: "Tab 2")
        sut.insertTab(title: "Tab 3")

        sut.selectedIndex = 1

        FBSnapshotVerifyView(sut)
    }
}
