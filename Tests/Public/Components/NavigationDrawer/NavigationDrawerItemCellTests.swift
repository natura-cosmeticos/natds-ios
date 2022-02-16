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

    func test_init_hasOnlyText() {
        let leftViews = systemUnderTest.leftView.subviews.count
        let rightViews = systemUnderTest.rightView.subviews.count
        let titleViews = systemUnderTest.titleRightView.subviews.count

        XCTAssertEqual(leftViews, 0)
        XCTAssertEqual(rightViews, 0)
        XCTAssertEqual(titleViews, 0)
    }

    func test_init_hasSelectionStyleAsNone() {
        XCTAssertEqual(systemUnderTest.selectionStyle, .none)
    }

    func test_cellWithLeftIcon_hasIcon() {
        systemUnderTest.actionLeft = .icon(getIconMockup(.outlinedDefaultMockup))

        let iconView = systemUnderTest.leftView.subviews
             .compactMap { $0 as? IconView }
             .first

        guard let icon = iconView else {
            XCTFail("Expected non-nil icon")
            return
        }

        XCTAssertFalse(icon.isHidden)
    }

    func test_cellWithRightIcon_hasIcon() {
        systemUnderTest.actionRight = .icon(getIconMockup(.outlinedDefaultMockup))

        let iconView = systemUnderTest.rightView.subviews
             .compactMap { $0 as? IconView }
             .first

        guard let icon = iconView else {
            XCTFail("Expected non-nil icon")
            return
        }

        XCTAssertFalse(icon.isHidden)
    }

    func test_cellWithSetIconTitle_hasIcon() {
        systemUnderTest.actionTitleRight = .icon(getIconMockup(.outlinedDefaultMockup))

        let iconView = systemUnderTest.titleRightView.subviews
             .compactMap { $0 as? IconView }
             .first

        guard let icon = iconView else {
            XCTFail("Expected non-nil icon")
            return
        }

        XCTAssertFalse(icon.isHidden)
    }

    func test_cellWithTitleAction_removePreviousTitleActions() {
        systemUnderTest.actionTitleRight = .icon(getIconMockup(.outlinedDefaultMockup))
        systemUnderTest.actionTitleRight = .badge("Badge")
        systemUnderTest.actionTitleRight = .dot

        let iconView = systemUnderTest.titleRightView.subviews
            .compactMap { $0 as? IconView }
            .first
        let dotView = systemUnderTest.titleRightView.subviews
            .compactMap { $0 as? NatBadge }
            .first
        let badgeTextView = systemUnderTest.titleRightView.subviews
            .compactMap { $0 as? NatTag }
            .first

        guard let dot = dotView else {
            XCTFail("Expected non-nil dot")
            return
        }

        XCTAssertNil(iconView)
        XCTAssertNil(badgeTextView)
        XCTAssertFalse(dot.isHidden)
    }

    func test_init_tagTextAsNil() {
        XCTAssertEqual(systemUnderTest.tagText, nil)
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
