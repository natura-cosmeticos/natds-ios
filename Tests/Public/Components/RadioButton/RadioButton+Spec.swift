import Quick
import Nimble

@testable import NatDS

final class RadioButtonSpec: QuickSpec {

    override func spec() {
        var systemUnderTest: NatRadioButton!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = NatRadioButton()
        }

        describe("#init") {
            it("starts enabled") {
                expect(systemUnderTest.radioButton.isEnabled).to(beTrue())
            }

            it("starts unselected") {
                expect(systemUnderTest.radioButton.isSelected).to(beFalse())
            }

            it("has no text") {
                expect(systemUnderTest.radioButton.text).to(beNil())
            }
        }

        describe("#configure(text:)") {
            beforeEach {
                systemUnderTest.configure(text: "Checkbox description")
            }

            it("sets a text label") {
                expect(systemUnderTest.radioButton.labelComponent).toEventually(equal("Checkbox description"))
            }
        }

        describe("#configure(isSelected:)") {
            context("false") {
                beforeEach {
                    systemUnderTest.configure(isSelected: false)
                }

                it("is not selected") {
                    expect(systemUnderTest.radioButton.isSelected).to(beFalse())
                }
            }
            context("true") {
                beforeEach {
                    systemUnderTest.configure(isSelected: true)
                }

                it("is selected") {
                    expect(systemUnderTest.radioButton.isSelected).to(beTrue())
                }
            }
        }

        describe("#configure(isEnabled:)") {
            context("false") {
                beforeEach {
                    systemUnderTest.configure(isEnabled: false)
                }

                it("is disabled") {
                    expect(systemUnderTest.radioButton.isEnabled).to(beFalse())
                }
            }
            context("true") {
                beforeEach {
                    systemUnderTest.configure(isEnabled: true)
                }

                it("is enabled") {
                    expect(systemUnderTest.radioButton.isEnabled).to(beTrue())
                }
            }
        }

    }
}
