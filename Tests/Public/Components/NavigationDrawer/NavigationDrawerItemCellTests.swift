import XCTest

@testable import NatDS

final class NavigationDrawerItemCellTests: XCTestCase {
    var systemUnderTest: NavigationDrawerItemCell!

    override func setUp() {
        super.setUp()

        ConfigurationStorage.shared.currentTheme = StubTheme()

        systemUnderTest = NavigationDrawerItemCell()
        systemUnderTest.frame = CGRect(x: 0, y: 0, width: 320, height: 48)
        systemUnderTest.title = "Menu Item"
    }

    func test_init_hasADefaultIcon() {
       let iconView = systemUnderTest.subviews
            .compactMap { $0 as? IconView }
            .first

        if let iconView = iconView {
            XCTAssertFalse(iconView.defaultImageView.isHidden)
        }
    }

    func test_init_hasSelectionStyleAsNone() {
        XCTAssertEqual(systemUnderTest.selectionStyle, .none)
    }

    func test_init_tagTextAsNil() {
        XCTAssertEqual(systemUnderTest.tagText, nil)
    }

    func test_init_tagView_isHidden() {
        let tag = systemUnderTest.contentView.subviews
            .compactMap { $0 as? NatTag }
            .first
        guard let tagView = try? XCTUnwrap(tag) else { return }

        XCTAssertEqual(tagView.isHidden, true)
    }

    func test_setTagText_showsTagView() throws {
        systemUnderTest.tagText = "Tag"

        let tag = systemUnderTest.contentView.subviews
            .compactMap { $0 as? NatTag }
            .first
        guard let tagView = try? XCTUnwrap(tag) else { return }

        XCTAssertEqual(tagView.isHidden, false)
        let label = try XCTUnwrap(tagView.subviews.first as? UILabel)
        XCTAssertEqual(label.text, "Tag")
    }

    func test_setTagText_asNil_hidesTagView() {
        systemUnderTest.tagText = "Tag"

        let tag = systemUnderTest.contentView.subviews
            .compactMap { $0 as? NatTag }
            .first
        guard let tagView = try? XCTUnwrap(tag) else { return }

        XCTAssertEqual(tagView.isHidden, false)

        systemUnderTest.tagText = nil
        XCTAssertEqual(tagView.isHidden, true)
    }
}
