import Quick
import Nimble

@testable import NatDS

final class ButtonOutlinedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ButtonOutlinedStyle.self
        var button: UIButton!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            button = UIButton()
        }

        describe("#applyStyle") {
            beforeEach {
                systemUnderTest.applyStyle(on: button)
            }

            it("returns a expect font") {
                let size = getTheme().font.sizes.button
                let weight = getTheme().font.weights.medium
                expect(button.titleLabel?.font.pointSize).to(equal(size))
                expect(button.titleLabel?.font.getWeight()).to(equal(weight))
            }

            it("returns a expect backgroundColor") {
                expect(button.backgroundColor).to(equal(.clear))
            }

            it("returns a expect cornerRadius") {
                let borderRadius = getTheme().borderRadius.medium
                expect(button.layer.cornerRadius).to(equal(borderRadius))
            }

            it("returns a expect borderWidth") {
                expect(button.layer.borderWidth).to(equal(1))
            }

            it("returns a expect borderColor") {
                expect(button.layer.borderColor).to(equal(NatColors.primary.cgColor))
            }

            it("returns a expect contentEdgeInsets") {
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

                it("returns a expect borderColor") {
                    expect(button.layer.borderColor).to(equal(NatColors.primary.cgColor))
                }
            }

            context("when isEnabled is false") {
                beforeEach {
                    button.isEnabled = false
                    systemUnderTest.applyStyleForStates(on: button)
                }

                it("returns a expect borderColor") {
                    let color = NatColors.onSurface.withAlphaComponent(NatOpacities.opacity03).cgColor

                    expect(button.layer.borderColor).to(equal(color))
                }
            }
        }

        describe("#applyStyleForState") {
            context("when isEnabled is true and Title is nil") {
                beforeEach {
                    button.isEnabled = true
                    systemUnderTest.applyStyleForTitle(nil, on: button)
                }

                it("returns a expect attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .normal)
                    expect(attributedTitle).to(beNil())
                }
            }

            context("when isEnabled is true and Title has a value") {
                let title = "title"
                var attributes: [NSAttributedString.Key: Any]!

                beforeEach {
                    button.isEnabled = true

                    systemUnderTest.applyStyleForTitle(title, on: button)

                    let attributedTitle = button.attributedTitle(for: .normal)
                    attributes = attributedTitle!.attributes(at: 0, effectiveRange: nil)
                }

                it("returns a expect attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .normal)

                    expect(attributedTitle?.string).to(equal(title.uppercased()))
                }

                it("returns a expect kern") {
                    let kern = attributes[.kern] as? CGFloat

                    expect(kern).to(equal(0.44))
                }

                it("returns a expect foregroundColor") {
                    let foregroundColor = attributes[.foregroundColor] as? UIColor

                    expect(foregroundColor).to(equal(NatColors.onSurface))
                }
            }

            context("when isEnabled is false and Title is nil") {
                beforeEach {
                    button.isEnabled = false
                    systemUnderTest.applyStyleForTitle(nil, on: button)
                }

                it("returns a expect attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .disabled)
                    expect(attributedTitle).to(beNil())
                }
            }

            context("when isEnabled is false and Title has a value") {
                let title = "title"
                var attributes: [NSAttributedString.Key: Any]!

                beforeEach {
                    button.isEnabled = false

                    systemUnderTest.applyStyleForTitle(title, on: button)

                    let attributedTitle = button.attributedTitle(for: .disabled)
                    attributes = attributedTitle!.attributes(at: 0, effectiveRange: nil)
                }

                it("returns a expect attributedTitle") {
                    let attributedTitle = button.attributedTitle(for: .normal)

                    expect(attributedTitle?.string).to(equal(title.uppercased()))
                }

                it("returns a expect kern") {
                    let kern = attributes[.kern] as? CGFloat

                    expect(kern).to(equal(0.44))
                }

                it("returns a expect foregroundColor") {
                    let foregroundColor = attributes[.foregroundColor] as? UIColor

                    expect(foregroundColor)
                        .to(equal(NatColors.onSurface.withAlphaComponent(NatOpacities.opacity06)))
                }
            }
        }
    }
}
