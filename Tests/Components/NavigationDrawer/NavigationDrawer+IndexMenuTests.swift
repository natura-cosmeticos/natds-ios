import XCTest
@testable import NatDS

class NavigationDrawerIndexMenuTests: XCTest {
    var sut: NavigationDrawer.IndexMenu!

    func test_init_hasExpectedValues() {
        let indexPath = IndexPath(row: 1, section: 0)

        sut = NavigationDrawer.IndexMenu(indexPath)

        XCTAssertEqual(sut.item, indexPath.section)
        XCTAssertEqual(sut.subitem, indexPath.row)
    }
}
