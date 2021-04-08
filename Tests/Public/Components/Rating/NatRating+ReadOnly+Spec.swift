import Quick
import Nimble

@testable import NatDS

final class NatRatingReadOnlySpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatRating!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatRating(style: .readOnly)
        }

        describe("#init") {
            var stackView: UIStackView?

            beforeEach {
                stackView = systemUnderTest.subviews.first as? UIStackView
            }

            it("is disabled") {
                expect(systemUnderTest.isUserInteractionEnabled).to(beFalse())
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
                systemUnderTest.configure(state: .enabled)
            }

            it("is remains disabled") {
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

            it("doesn't have a label") {
                expect(label).to(beNil())
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
