import Quick
import Nimble

@testable import NatDS

final class TextFieldStatesSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: TextField!
        var stackView: UIStackView?
        var helperLabel: UILabel?
        var titleLabel: UILabel?
        var feedbackIcon: UIImageView?

        func getItemsFromView() {
            stackView = systemUnderTest.subviews
                .compactMap { $0 as? UIStackView }
                .first

            helperLabel = stackView?.arrangedSubviews
                .compactMap { $0 as? UILabel }
                .first

            feedbackIcon = stackView?.arrangedSubviews
                .compactMap { $0 as? UIImageView }
                .first

            titleLabel = systemUnderTest.subviews
                .compactMap { $0 as? UILabel }
                .first
        }

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = TextField()
            getItemsFromView()
        }

        describe("#configure: error") {
            beforeEach {
                systemUnderTest.configure(state: .error, with: "Error message")
            }

            it("shows error message") {
                expect(helperLabel?.text).toEventually(equal("Error message"))
            }

            it("shows UI for error state") {
                expect(systemUnderTest.textField.borderColor).to(equal(getUIColorFromTokens(\.colorAlert)))
                expect(systemUnderTest.textField.borderWidth).to(equal(2))
                expect(systemUnderTest.textField.tintColor).to(equal(getUIColorFromTokens(\.colorAlert)))
                expect(helperLabel?.textColor).to(equal(getUIColorFromTokens(\.colorAlert)))
                expect(titleLabel?.textColor).to(equal(getUIColorFromTokens(\.colorAlert)))
                expect(feedbackIcon?.tintedColor).to(equal(getUIColorFromTokens(\.colorAlert)))
                expect(feedbackIcon?.isHidden).to(beFalse())
            }
        }

        describe("#configure: success") {
            beforeEach {
                systemUnderTest.configure(state: .success, with: "Success message")
            }

            it("shows error message") {
                expect(helperLabel?.text).toEventually(equal("Success message"))
            }

            it("shows UI for error state") {
                expect(systemUnderTest.textField.borderColor).to(equal(getUIColorFromTokens(\.colorSuccess)))
                expect(systemUnderTest.textField.borderWidth).to(equal(1))
                expect(systemUnderTest.textField.tintColor).to(equal(getUIColorFromTokens(\.colorSuccess)))
                expect(helperLabel?.textColor).to(equal(getUIColorFromTokens(\.colorSuccess)))
                expect(titleLabel?.textColor).to(equal(getUIColorFromTokens(\.colorSuccess)))
                expect(feedbackIcon?.tintedColor).to(equal(getUIColorFromTokens(\.colorSuccess)))
                expect(feedbackIcon?.isHidden).to(beFalse())
            }
        }
    }
}
