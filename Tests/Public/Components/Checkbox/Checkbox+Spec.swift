import Quick
import Nimble

@testable import NatDS

final class CheckboxSpec: QuickSpec {

    override func spec() {
        var systemUnderTest: NatCheckbox!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = NatCheckbox()
        }

        describe("#init") {
            it("starts enabled") {
                expect(systemUnderTest.checkbox.isEnabled).to(beTrue())
            }

            it("starts unselected") {
                expect(systemUnderTest.checkbox.isSelected).to(beFalse())
            }

            it("has no text") {
                expect(systemUnderTest.checkbox.text).to(beNil())
            }
        }

        describe("#configure(text:)") {
            beforeEach {
                systemUnderTest.configure(text: "Checkbox description")
            }

            it("sets a text label") {
                expect(systemUnderTest.checkbox.labelComponent).toEventually(equal("Checkbox description"))
            }
        }

        describe("#configure(isSelected:)") {
            context("false") {
                beforeEach {
                    systemUnderTest.configure(isSelected: false)
                }

                it("is not selected") {
                    expect(systemUnderTest.checkbox.isSelected).to(beFalse())
                }
            }
            context("true") {
                beforeEach {
                    systemUnderTest.configure(isSelected: true)
                }

                it("is selected") {
                    expect(systemUnderTest.checkbox.isSelected).to(beTrue())
                }
            }
        }

        describe("#configure(isEnabled:)") {
            context("false") {
                beforeEach {
                    systemUnderTest.configure(isEnabled: false)
                }

                it("is disabled") {
                    expect(systemUnderTest.checkbox.isEnabled).to(beFalse())
                }
            }
            context("true") {
                beforeEach {
                    systemUnderTest.configure(isEnabled: true)
                }

                it("is enabled") {
                    expect(systemUnderTest.checkbox.isEnabled).to(beTrue())
                }
            }
        }

        describe("#configure(isIndeterminate:)") {
            context("false") {
                beforeEach {
                    systemUnderTest.configure(isIndeterminate: false)
                }

                it("is not indeterminate") {
                    expect(systemUnderTest.checkbox.isIndeterminate).to(beFalse())
                }
            }
            context("true") {
                beforeEach {
                    systemUnderTest.configure(isIndeterminate: true)
                }

                it("is is indeterminate") {
                    expect(systemUnderTest.checkbox.isIndeterminate).to(beTrue())
                }
            }
        }

    }
}
