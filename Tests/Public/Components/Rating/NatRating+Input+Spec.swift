import Quick
import Nimble

@testable import NatDS

final class NatRatingInputSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatRating!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatRating(style: .input)
        }

        describe("#init") {
            var stackView: UIStackView?

            beforeEach {
                stackView = systemUnderTest.subviews.first as? UIStackView
            }

            it("is enabled") {
                expect(systemUnderTest.isUserInteractionEnabled).to(beTrue())
            }

            it("has value 0") {
                expect(systemUnderTest.getValue()).to(equal(0))
            }

            it("has 5 stars") {
                expect(stackView?.arrangedSubviews.count).to(equal(5))
            }
        }

        describe("#configure(state:)") {
            beforeEach {
                systemUnderTest.configure(state: .disabled)
            }

            it("is disabled") {
                expect(systemUnderTest.isUserInteractionEnabled).to(beFalse())
            }
        }

        describe("#configure(text:)") {
            var label: UILabel?

            beforeEach {
                label = systemUnderTest.subviews
                    .compactMap { $0 as? UILabel }
                    .first
                systemUnderTest.configure(text: "Placeholder")
            }

            it("shows label with configured text") {
                expect(label?.isHidden).to(beFalse())
                expect(label?.text).toEventually(equal("Placeholder"))
            }
        }

        describe("#configure(rate:)") {
            beforeEach {
                systemUnderTest.configure(rate: 3)
            }

            it("changes input value") {
                expect(systemUnderTest.getValue()).to(equal(3))
            }
        }
    }
}
