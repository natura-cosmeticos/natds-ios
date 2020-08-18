import Quick
import Nimble

@testable import NatDS

final class DialogStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = DialogStyle.self

        beforeEach {
            DesignSystem().configure(with: .theBodyShopLight)
        }

        describe("#createLabelForTitle") {
            var label: UILabel!

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
                label = systemUnderTest.createLabelForTitle(title: "StubText")
            }

            it("returns an expected value for size font") {
                let expectedSize = getTheme().font.sizes.heading6

                expect(label.font.pointSize).to(equal(expectedSize))
            }

            it("returns a expect value for weight") {
                let expectedWeight = getTheme().font.weights.medium

                expect(label.font.getWeight()).to(equal(expectedWeight))
            }

            it("returns a expect value for weight") {
                let expectedColor = getTheme().colors.highEmphasis
                expect(label.textColor).to(equal(expectedColor))
            }

            it("returns a expect text") {
                expect(label.text).to(equal("StubText"))
            }

            it("return an expected kern") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let kern = attributes[.kern] as? CGFloat
                let expectedKern = getTheme().font.letterSpacings.heading6

                expect(kern).to(equal(expectedKern))
            }

            it("returns an expected color") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let foregroundColor = attributes[.foregroundColor] as? UIColor
                let expectedColor = getTheme().colors.highEmphasis

                expect(foregroundColor).to(equal(expectedColor))
            }
        }

        describe("#createLabelForBody") {
            var label: UILabel!

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
                label = systemUnderTest.createLabelForBody(body: "StubText")
            }

            it("returns an expected value for size font") {
                let expectedSize = getTheme().font.sizes.body1

                expect(label.font.pointSize).to(equal(expectedSize))
            }

            it("returns a expect value for weight") {
                let expectedWeight = getTheme().font.weights.regular

                expect(label.font.getWeight()).to(equal(expectedWeight))
            }

            it("returns a expect value for weight") {
                let expectedColor = getTheme().colors.highEmphasis
                expect(label.textColor).to(equal(expectedColor))
            }

            it("returns a expect text") {
                expect(label.text).to(equal("StubText"))
            }

            it("return an expected kern") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let kern = attributes[.kern] as? CGFloat
                let expectedKern = getTheme().font.letterSpacings.body1

                expect(kern).to(equal(expectedKern))
            }

            it("returns an expected color") {
                let attributedText = label.attributedText
                let attributes = attributedText!.attributes(at: 0, effectiveRange: nil)
                let foregroundColor = attributes[.foregroundColor] as? UIColor
                let expectedColor = getTheme().colors.highEmphasis

                expect(foregroundColor).to(equal(expectedColor))
            }
        }
    }
}
