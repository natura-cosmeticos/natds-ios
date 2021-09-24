import Quick
import Nimble

@testable import NatDS

final class ButtonContainedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ButtonContainedStyle.self
        var button: UIButton!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            button = UIButton()
        }

        describe("#applyStyle") {
            beforeEach {
                systemUnderTest.applyStyle(on: button)
            }

            it("returns an expected font") {
                let expectedSize = getComponentAttributeFromTheme(\.buttonLabelFontSize)
                let expectedWeight = getComponentAttributeFromTheme(\.buttonLabelPrimaryFontWeight)

                expect(button.titleLabel?.font.pointSize).to(equal(expectedSize))
                expect(button.titleLabel?.font.getWeight()).to(equal(expectedWeight))
            }

            it("returns an expected backgroundColor") {
                let expectedColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBackground)

                expect(button.backgroundColor).to(equal(expectedColor))
            }

            it("returns an expected cornerRadius") {
                let borderRadius = getComponentAttributeFromTheme(\.buttonBorderRadius)

                expect(button.layer.cornerRadius).to(equal(borderRadius))
            }

            it("returns an expected borderWidth") {
                expect(button.layer.borderWidth).to(equal(0))
            }

            it("returns an expected borderColor") {
                let expectedColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBorder).cgColor

                expect(button.layer.borderColor).to(equal(expectedColor))
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
                    let expectedColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBorder).cgColor

                    expect(button.layer.borderColor).to(equal(expectedColor))
                }

                it("returns an expected backgroundColor") {
                    let expectedColor = getUIColorFromComponentAttributes(\.buttonContainedColorEnableBackground)

                    expect(button.backgroundColor).to(equal(expectedColor))
                }
            }

            context("when button is disabled") {
                beforeEach {
                    button.isEnabled = false
                    systemUnderTest.applyStyleForStates(on: button)
                }

                it("returns an expected borderColor") {
                    let expectedColor = getUIColorFromComponentAttributes(\.buttonContainedColorDisableBorder).cgColor

                    expect(button.layer.borderColor).to(equal(expectedColor))
                }

                it("returns an expected backgroundColor") {
                    let expectedColor = getUIColorFromComponentAttributes(\.buttonContainedColorDisableBackground)

                    expect(button.backgroundColor).to(equal(expectedColor))
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
                    let expectedColor = getUIColorFromTokens(\.colorOnPrimary)

                    expect(foregroundColor).to(equal(expectedColor))
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
                    let expectedColor = getUIColorFromComponentAttributes(\.buttonContainedColorDisableLabel)

                    expect(foregroundColor).to(equal(expectedColor))
                }
            }
        }
    }
}
