import Quick
import Nimble

@testable import NatDS

final class TextFieldTypesSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: TextField!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = TextField()
        }

        describe("#type: number") {
            beforeEach {
                systemUnderTest.configure(type: .number)
            }

            it("returns expected configuration") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.numberPad))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.no))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.none))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beFalse())
            }
        }

        describe("#type: password") {
            beforeEach {
                systemUnderTest.configure(type: .password())
            }

            it("returns expected configuration") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.default))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.no))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.none))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beTrue())
            }
        }

        describe("#type: password with visibility on") {
            var iconButtonVisibility: NatIconButton?

            beforeEach {
                systemUnderTest.configure(type: .password())
                systemUnderTest.showVisibilityIcon()

                iconButtonVisibility = systemUnderTest.subviews
                    .compactMap { $0 as? NatIconButton }
                    .first

                iconButtonVisibility?.gestureRecognizers?.first?.sendGesturesEvents()
            }

            it("shows password on visibility icon tap") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.default))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.no))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.none))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beFalse())
            }
        }

        describe("#type: name") {
            beforeEach {
                systemUnderTest.configure(type: .name)
            }

            it("returns expected configuration") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.default))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.no))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.words))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beFalse())
            }
        }

        describe("#type: text") {
            beforeEach {
                systemUnderTest.configure(type: .text)
            }

            it("returns expected configuration") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.default))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.yes))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.none))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beFalse())
            }
        }
    }
}
