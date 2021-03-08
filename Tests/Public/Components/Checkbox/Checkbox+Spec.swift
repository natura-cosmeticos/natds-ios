import Quick
import Nimble

@testable import NatDS

final class CheckboxSpec: QuickSpec {

    override func spec() {
        var sut: NatCheckbox!

        describe("#init") {
            context("when it starts without text") {
                beforeEach {
                    ConfigurationStorage.shared.currentTheme = StubTheme()

                    sut = NatCheckbox()
                }

                it("starts enabled") {
                    sut.configure(isEnabled: true)
                    expect(sut.checkbox.isEnabled).to(equal(true))
                }

                it("starts unabled") {
                    sut.configure(isEnabled: false)
                    expect(sut.checkbox.isEnabled).to(equal(false))
                }

                it("starts selected") {
                    sut.configure(isSelected: true)
                    expect(sut.checkbox.isSelected).to(equal(true))
                }

                it("starts unselected") {
                    sut.configure(isSelected: false)
                    expect(sut.checkbox.isSelected).to(equal(false))
                }

                it("has no text") {
                    expect(sut.checkbox.text).to(beNil())
                }

                it("has text") {
                    sut.configure(text: "label text")
                    expect(sut.checkbox.labelComponent).to(equal("label text"))
                }

                it("starts indeterminate") {
                    sut.configure(isIndeterminate: true)
                    expect(sut.checkbox.isIndeterminate).to(equal(true))
                }
            }
        }
    }
}
