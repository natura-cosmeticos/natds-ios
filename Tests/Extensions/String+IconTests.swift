import XCTest
@testable import NatDS

class StringIconTests: XCTestCase {

    func test_withIcon_returnsAttributedStringWithCaptionFontAndIconFontInIcon() {
        let randomIcon = (Icon.allCases.randomElement() ?? Icon.filledActionCancel).rawValue

        let text = "Text"
        let fullText = "\(randomIcon) \(text)"

        let textRange = fullText.range(for: text)
        let iconRange = fullText.range(for: randomIcon)

        let expectTextFont = Fonts.caption
        let expectTextLineOffset = CGFloat(1)

        let expectIconFont = UIFont.iconFont(ofSize: Fonts.caption.lineHeight)
        let expectIconLineOffset = CGFloat(-2)

        let result = "Text".withIcon(randomIcon)

        let textAttributes = result.attributes(at: textRange.location, effectiveRange: nil)
        let iconAttributes = result.attributes(at: iconRange.location, effectiveRange: nil)

        XCTAssertEqual(textAttributes[.font] as? UIFont, expectTextFont)
        XCTAssertEqual(textAttributes[.baselineOffset] as? CGFloat, expectTextLineOffset)

        XCTAssertEqual(iconAttributes[.font] as? UIFont, expectIconFont)
        XCTAssertEqual(iconAttributes[.baselineOffset] as? CGFloat, expectIconLineOffset)
    }

    func test_rangeFor_returnsExpectedNSRange() {
        let text = "Some text"
        let expectRange = NSRange(location: 0, length: 4)

        let result = text.range(for: "Some")

        XCTAssertEqual(result, expectRange)
    }

}
