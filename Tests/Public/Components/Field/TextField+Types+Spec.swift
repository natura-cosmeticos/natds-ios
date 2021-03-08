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
            
            it("shows number keyboard") {
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
            
            it("shows number keyboard") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.default))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.no))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.none))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beTrue())
            }
        }
        
        describe("#type: name") {
            beforeEach {
                systemUnderTest.configure(type: .name)
            }
            
            it("shows number keyboard") {
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
            
            it("shows number keyboard") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.default))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.yes))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.none))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beFalse())
            }
        }
    }
}
