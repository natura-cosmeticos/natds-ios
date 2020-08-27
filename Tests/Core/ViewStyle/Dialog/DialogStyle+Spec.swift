import Quick
import Nimble

@testable import NatDS

final class DialogStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = DialogStyle.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()
        }

        describe("#createLabelForTitle") {
            var label: UILabel!

            beforeEach {
                label = systemUnderTest.createLabelForTitle(title: "StubText")
            }

            it("returns an expected value for size font") {
                let expectedSize = NatFonts.TextStyle.heading6.size

                expect(label.font.pointSize).to(equal(expectedSize))
            }

            it("returns a expect value for weight") {
                let expectedWeight = NatFonts.TextStyle.heading6.weight

                expect(label.font.getWeight()).to(equal(expectedWeight))
            }

            it("returns a expect value for weight") {
                let expectedColor = getUIColorFromTokens(\.colorHighEmphasis)
                expect(label.textColor).to(equal(expectedColor))
            }

            it("returns a expect text") {
                expect(label.text).to(equal("StubText"))
            }

            it("return an expected kern") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let kern = attributes[.kern] as? CGFloat
                let expectedKern = NatFonts.TextStyle.heading6.letterSpacing

                expect(kern).to(equal(expectedKern))
            }

            it("returns an expected color") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let foregroundColor = attributes[.foregroundColor] as? UIColor
                let expectedColor = getUIColorFromTokens(\.colorHighEmphasis)

                expect(foregroundColor).to(equal(expectedColor))
            }
        }

        describe("#createLabelForBody") {
            var label: UILabel!

            beforeEach {
                label = systemUnderTest.createLabelForBody(body: "StubText")
            }

            it("returns an expected value for size font") {
                let expectedSize = NatFonts.TextStyle.body1.size

                expect(label.font.pointSize).to(equal(expectedSize))
            }

            it("returns a expect value for weight") {
                let expectedWeight = NatFonts.TextStyle.body1.weight

                expect(label.font.getWeight()).to(equal(expectedWeight))
            }

            it("returns a expect value for weight") {
                let expectedColor = getUIColorFromTokens(\.colorHighEmphasis)
                expect(label.textColor).to(equal(expectedColor))
            }

            it("returns a expect text") {
                expect(label.text).to(equal("StubText"))
            }

            it("return an expected kern") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let kern = attributes[.kern] as? CGFloat
                let expectedKern = NatFonts.TextStyle.body1.letterSpacing

                expect(kern).to(equal(expectedKern))
            }

            it("returns an expected color") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let foregroundColor = attributes[.foregroundColor] as? UIColor
                let expectedColor = getUIColorFromTokens(\.colorHighEmphasis)

                expect(foregroundColor).to(equal(expectedColor))
            }
        }
    }
}
