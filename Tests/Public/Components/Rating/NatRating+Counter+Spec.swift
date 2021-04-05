import Quick
import Nimble

@testable import NatDS

final class NatRatingCounterSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatRating!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatRating(style: .counter)
        }

        describe("#init") {
            var stackView: UIStackView?
            var iconViews: [IconView]?

            beforeEach {
                stackView = systemUnderTest.subviews.first as? UIStackView
                iconViews = stackView?.arrangedSubviews
                    .compactMap { $0 as? IconView }
            }

            it("is disabled") {
                expect(systemUnderTest.isUserInteractionEnabled).to(beFalse())
            }

            it("has 1 star") {
                expect(iconViews?.count).to(equal(1))
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
                var stackView: UIStackView?
                stackView = systemUnderTest.subviews.first as? UIStackView

                label = stackView?.subviews
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

            it("doesn't change value") {
                expect(systemUnderTest.getValue()).to(equal(0))
            }
        }
    }
}
