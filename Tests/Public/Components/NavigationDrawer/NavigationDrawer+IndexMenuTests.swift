import XCTest

@testable import NatDS

final class NavigationDrawerIndexMenuTests: XCTestCase {
    var sut: NavigationDrawer.IndexMenu!

    func test_init_hasExpectedValues() {
        sut = NavigationDrawer.IndexMenu(item: 1, subitem: 0)

        XCTAssertEqual(sut.item, 1)
        XCTAssertEqual(sut.subitem, 0)
    }
}
