import XCTest
@testable import NatDS

class NSMutableAttributedStringBuilderTests: XCTestCase {

    var string: String!

    var substring: String!

    override func setUp() {
        string = "Lorem ipsum dolor sit amet."
        substring = "ipsum"

        ConfigurationStorage.shared.currentTheme = StubTheme()
    }

    func test_applyFont_returnsAttributedStringWithAppliedFont() {
        let expectedFont = NatFonts.font(ofSize: .caption)
        let range = string.range(for: substring)

        let attributedString = NSMutableAttributedString(string: string)
            .apply(font: expectedFont, in: substring)

        let attribute = attributedString.attributes(at: range.location,
                                                    effectiveRange: nil).first

        XCTAssertEqual(attribute?.key, .font)
        XCTAssertEqual(attribute?.value as? UIFont, expectedFont)
    }

    func test_applyParagraphStyle_returnsAttributedStringWithAppliedParagraphStyle() {
        let expectedParagraphStyle = NSMutableParagraphStyle()
        expectedParagraphStyle.maximumLineHeight = NatFonts.font(ofSize: .caption).lineHeight
        let range = string.range(for: substring)

        let attributedString = NSMutableAttributedString(string: string)
            .apply(paragraphStyle: expectedParagraphStyle, in: substring)

        let attribute = attributedString.attributes(at: range.location,
                                                    effectiveRange: nil).first

        XCTAssertEqual(attribute?.key, .paragraphStyle)
        XCTAssertEqual(attribute?.value as? NSParagraphStyle, expectedParagraphStyle)
    }

    func test_applyLineOffset_returnsAttributedStringWithAppliedLineOffset() {
        let expectedBaseLineOffset: CGFloat = -2
        let range = string.range(for: substring)

        let attributedString = NSMutableAttributedString(string: string)
            .apply(lineOffset: expectedBaseLineOffset, in: substring)

        let attribute = attributedString.attributes(at: range.location,
                                                    effectiveRange: nil).first

        XCTAssertEqual(attribute?.key, .baselineOffset)
        XCTAssertEqual(attribute?.value as? CGFloat, expectedBaseLineOffset)
    }

    func test_applyForegroundColor_returnsAttributedStringWithAppliedForegroundColor() {
        let expectedColor = UIColor.red

        let attributedString = NSMutableAttributedString(string: string)
            .apply(foregroundColor: expectedColor)

        let attribute = attributedString.attributes(at: string.range(for: string).location,
                                                    effectiveRange: nil).first

        XCTAssertEqual(attribute?.key, .foregroundColor)
        XCTAssertEqual(attribute?.value as? UIColor, expectedColor)
    }

    func test_applyKern_returnsAttributedStringWithAppliedKern() {
        let expectedValue: CGFloat = 2.25

        let attributedString = NSMutableAttributedString(string: string)
            .apply(kernValue: expectedValue)

        let attribute = attributedString.attributes(at: string.range(for: string).location,
                                                    effectiveRange: nil).first

        XCTAssertEqual(attribute?.key, .kern)
        XCTAssertEqual(attribute?.value as? CGFloat, expectedValue)
    }
}
