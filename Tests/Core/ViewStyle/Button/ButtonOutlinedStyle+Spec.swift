import Quick
import Nimble

@testable import NatDS

final class ButtonOutlinedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ButtonOutlinedStyle.self
        var button: UIButton!

        beforeEach {
            DesignSystem().configure(with: .theBodyShopLight)
            button = UIButton()
        }

        describe("#applyStyle") {
            beforeEach {
                systemUnderTest.applyStyle(on: button)
            }

            it("returns an expected font") {
                let size = getTheme().font.sizes.button
                let weight = getTheme().font.weights.medium
                expect(button.titleLabel?.font.pointSize).to(equal(size))
                expect(button.titleLabel?.font.getWeight()).to(equal(weight))
            }

            it("returns an expected backgroundColor") {
                expect(button.backgroundColor).to(beNil())
            }

            it("returns an expected cornerRadius") {
                let borderRadius = getFromThemeTokens(\.borderRadiusMedium)

                expect(button.layer.cornerRadius).to(equal(borderRadius))
            }

            it("returns an expected borderWidth") {
                expect(button.layer.borderWidth).to(equal(1))
            }

            it("returns an expected borderColor") {
                expect(button.layer.borderColor).to(equal(NatColors.primary.cgColor))
            }

            it("returns an expected contentEdgeInsets") {
                let spacing: CGFloat = 12

                expect(button.contentEdgeInsets.top).to(equal(spacing))
                expect(button.contentEdgeInsets.right).to(equal(spacing))
                expect(button.contentEdgeInsets.bottom).to(equal(spacing))
                expect(button.contentEdgeInsets.left).to(equal(spacing))
            }
        }

        describe("#applyStyleForState") {
            context("when button is enabled") {
                beforeEach {
                    button.isEnabled = true
                    systemUnderTest.applyStyleForStates(on: button)
                }

                it("returns an expected borderColor") {
                    expect(button.layer.borderColor).to(equal(NatColors.primary.cgColor))
                }
            }

            context("when button is disabled") {
                beforeEach {
                    button.isEnabled = false
                    systemUnderTest.applyStyleForStates(on: button)
                }

                it("returns an expected borderColor") {
                    let color = NatColors.onSurface.withAlphaComponent(NatOpacities.opacity03).cgColor

                    expect(button.layer.borderColor).to(equal(color))
                }
            }
        }

        describe("#applyStyleForTitle") {
            context("when button is enabled") {
                let title = "title".uppercased()
                var attributes: [NSAttributedString.Key: Any]!

                beforeEach {
                    button.isEnabled = true

                    systemUnderTest.applyStyleForTitle(title, on: button)

                    let attributedTitle = button.attributedTitle(for: .normal)
                    attributes = attributedTitle!.attributes(at: 0, effectiveRange: nil)
                }

                it("returns an expected attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .normal)

                    expect(attributedTitle?.string).to(equal(title))
                }

                it("returns an expected kern") {
                    let kern = attributes[.kern] as? CGFloat

                    expect(kern).to(equal(0.44))
                }

                it("returns an expected foregroundColor") {
                    let foregroundColor = attributes[.foregroundColor] as? UIColor

                    expect(foregroundColor).to(equal(getTheme().colors.onSurface))
                }
            }

            context("when button is disabled") {
                let title = "title".uppercased()
                var attributes: [NSAttributedString.Key: Any]!

                beforeEach {
                    button.isEnabled = false

                    systemUnderTest.applyStyleForTitle(title, on: button)

                    let attributedTitle = button.attributedTitle(for: .disabled)
                    attributes = attributedTitle!.attributes(at: 0, effectiveRange: nil)
                }

                it("returns an expected attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .normal)

                    expect(attributedTitle?.string).to(equal(title))
                }

                it("returns an expected kern") {
                    let kern = attributes[.kern] as? CGFloat

                    expect(kern).to(equal(0.44))
                }

                it("returns an expected foregroundColor") {
                    let foregroundColor = attributes[.foregroundColor] as? UIColor
                    let opacity = getFromThemeTokens(\.opacity08)

                    expect(foregroundColor)
                        .to(equal(NatColors.onSurface.withAlphaComponent(opacity)))
                }
            }
        }
    }
}
