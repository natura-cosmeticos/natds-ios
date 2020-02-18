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

        recordMode = true
    }

    func test_tab_initWhenHas3Tabs_returnsTabWith3TabItemViews() {
        let tabItems = [ TabItem(title: "Tab 1"), TabItem(title: "Tab 2"), TabItem(title: "Tab 3")]
        sut.insertTabs(tabs: tabItems)

        FBSnapshotVerifyView(sut)
    }
}
