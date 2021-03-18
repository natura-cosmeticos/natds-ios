import Quick
import Nimble

@testable import NatDS

final class TextFieldSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: TextField!
        var titleLabel: UILabel?
        var helperLabel: UILabel?
        
        
        func getItemsFromView() {
            titleLabel = systemUnderTest.subviews
                .compactMap { $0 as? UILabel }
                .first
            
            let stackView = systemUnderTest.subviews
                .compactMap { $0 as? UIStackView }
                .first
            
            helperLabel = stackView?.arrangedSubviews
                .compactMap { $0 as? UILabel }
                .first
        }
        
        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            
            systemUnderTest = TextField()
            getItemsFromView()
        }
        
        describe("#init") {
            it("returns expected default size mediumX") {
                expect(systemUnderTest.size.value).to(equal(NatSizes.mediumX))
            }

            it("has a title label") {
                expect(titleLabel?.isHidden).to(beFalse())
            }
            
            it("has helper label with no text") {
                expect(helperLabel?.text).to(beNil())
            }
            
            it("returns expected state: enabled") {
                expect(systemUnderTest.isEnabled).to(beTrue())
            }
            
            it("returns configuration for expected type: text") {
                expect(systemUnderTest.textField.keyboardType).to(equal(UIKeyboardType.default))
                expect(systemUnderTest.textField.autocorrectionType).to(equal(UITextAutocorrectionType.yes))
                expect(systemUnderTest.textField.autocapitalizationType).to(equal(UITextAutocapitalizationType.none))
                expect(systemUnderTest.textField.isSecureTextEntry).to(beFalse())
            }
        }
        
        describe("#configure: required") {
            beforeEach {
                systemUnderTest.configure(title: "Title")
                systemUnderTest.configure(required: true)
            }
            
            it("appends '*' to title label") {
                expect(systemUnderTest.title?.last).to(equal("*"))
            }
        }
        
        describe("#configure: disabled") {
            beforeEach {
                systemUnderTest.configure(isEnabled: false)
            }
            
            it("returns disabled interaction state") {
                expect(systemUnderTest.interactionState.isUserInteractionEnabled).to(beFalse())
            }
            
            it("returns disabled style overriding any other style") {
                expect(systemUnderTest.textField.borderColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis)))
                expect(systemUnderTest.textField.textColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis)))
                expect(systemUnderTest.textField.backgroundColor).to(equal(.clear))
                expect(titleLabel?.textColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis)))
                expect(helperLabel?.textColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis)))
            }
        }
        
        describe("#configure: disabled") {
            beforeEach {
                systemUnderTest.configure(readOnly: true)
            }
            
            it("returns read only interaction state") {
                expect(systemUnderTest.interactionState.isUserInteractionEnabled).to(beFalse())
            }
            
            it("returns read only style overriding any other style") {
                expect(systemUnderTest.textField.borderColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis)))
                expect(systemUnderTest.textField.textColor).to(equal(getUIColorFromTokens(\.colorHighEmphasis)))
                expect(systemUnderTest.textField.backgroundColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis).withAlphaComponent(0.25)))
                expect(titleLabel?.textColor).to(equal(getUIColorFromTokens(\.colorMediumEmphasis)))
                expect(helperLabel?.textColor).to(equal(getUIColorFromTokens(\.colorMediumEmphasis)))
            }
        }
        
        describe("#configure: helper text") {
            beforeEach {
                systemUnderTest.configure(helperText: "Helper")
            }
            
            it("shows helper label with configured text") {
                expect(systemUnderTest.helper).to(equal("Helper"))
                expect(helperLabel?.text).toEventually(equal("Helper"))
            }
        }
        
        describe("#configure: action icon") {
            var actionInvocations: Int!
            var iconButton: NatIconButton?
            
            beforeEach {
                actionInvocations = 0
                systemUnderTest.configure(icon: nil, with: { actionInvocations += 1 })
                
                iconButton = systemUnderTest.subviews
                    .compactMap { $0 as? NatIconButton }
                    .first
                
                iconButton?.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
            }
            
            it("shows icon button") {
                expect(iconButton).toNot(beNil())
                expect(iconButton?.isHidden).to(beFalse())
            }
            
            it("stores action and uses it in tap events") {
                expect(actionInvocations).toEventually(equal(1))
            }
        }
    }
}
