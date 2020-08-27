import XCTest

@testable import NatDS

final class NavigationDrawerSubitemCellTests: XCTestCase {
    var systemUnderTest: NavigationDrawerSubitemCell!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = StubThemeProtocol()

        systemUnderTest = NavigationDrawerSubitemCell()
    }

    func test_init_hasSelectionStyleAsNone() {
        XCTAssertEqual(systemUnderTest.selectionStyle, .none)
    }
}
