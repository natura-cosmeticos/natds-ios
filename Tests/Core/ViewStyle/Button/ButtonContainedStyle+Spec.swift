import Quick
import Nimble

@testable import NatDS

final class ButtonContainedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ButtonContainedStyle.self
        var button: UIButton!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
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
                expect(button.backgroundColor).to(equal(getTheme().colors.primary))
            }

            it("returns an expected cornerRadius") {
                let borderRadius = getTheme().borderRadius.medium

                expect(button.layer.cornerRadius).to(equal(borderRadius))
            }

            it("returns an expected borderWidth") {
                expect(button.layer.borderWidth).to(equal(0))
            }

            it("returns an expected borderColor") {
                let expectedColor = UIButton().layer.borderColor

                expect(button.layer.borderColor).to(equal(expectedColor))
            }

            it("returns an expected contentEdgeInsets") {
                let spacing = getTheme().spacing.small

                expect(button.contentEdgeInsets.top).to(equal(spacing))
                expect(button.contentEdgeInsets.right).to(equal(spacing))
                expect(button.contentEdgeInsets.bottom).to(equal(spacing))
                expect(button.contentEdgeInsets.left).to(equal(spacing))
            }
        }

        describe("#applyStyleForState") {
            context("when isEnabled is true") {
                beforeEach {
                    button.isEnabled = true
                    systemUnderTest.applyStyleForStates(on: button)
                }

                it("returns an expected borderColor") {
                    let expectedColor = UIButton().layer.borderColor

                    expect(button.layer.borderColor).to(equal(expectedColor))
                }

                it("returns an expected backgroundColor") {
                    expect(button.backgroundColor).to(equal(getTheme().colors.primary))
                }
            }

            context("when isEnabled is false") {
                beforeEach {
                    button.isEnabled = false
                    systemUnderTest.applyStyleForStates(on: button)
                }

                it("returns an expected borderColor") {
                    let expectedColor = UIButton().layer.borderColor

                    expect(button.layer.borderColor).to(equal(expectedColor))
                }

                it("returns an expected backgroundColor") {
                    let expectedColor = getTheme().colors.onSurface.withAlphaComponent(NatOpacities.opacity03)

                    expect(button.backgroundColor).to(equal(expectedColor))
                }
            }
        }

        describe("#applyStyleForTitle") {
            context("when isEnabled is true and Title is nil") {
                beforeEach {
                    button.isEnabled = true
                    systemUnderTest.applyStyleForTitle(nil, on: button)
                }

                it("returns an expected attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .normal)
                    expect(attributedTitle).to(beNil())
                }
            }

            context("when isEnabled is true and Title has a value") {
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

                    expect(foregroundColor).to(equal(NatColors.onPrimary))
                }
            }

            context("when isEnabled is false and Title is nil") {
                beforeEach {
                    button.isEnabled = false
                    systemUnderTest.applyStyleForTitle(nil, on: button)
                }

                it("returns an expected attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .disabled)
                    expect(attributedTitle).to(beNil())
                }
            }

            context("when isEnabled is false and Title has a value") {
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

                    expect(foregroundColor)
                        .to(equal(NatColors.onSurface.withAlphaComponent(NatOpacities.opacity06)))
                }
            }
        }
    }
}
