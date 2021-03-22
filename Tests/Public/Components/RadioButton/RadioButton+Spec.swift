import Quick
import Nimble

@testable import NatDS

final class RadioButtonSpec: QuickSpec {

    override func spec() {
        var sut: NatRadioButton!

        describe("#init") {
            context("when it starts without text") {
                beforeEach {
                    ConfigurationStorage.shared.currentTheme = StubTheme()

                    sut = NatRadioButton()
                }

                it("starts enabled") {
                    sut.configure(isEnabled: true)
                    expect(sut.radioButton.isEnabled).to(equal(true))
                }

                it("starts unabled") {
                    sut.configure(isEnabled: false)
                    expect(sut.radioButton.isEnabled).to(equal(false))
                }

                it("starts selected") {
                    sut.configure(isSelected: true)
                    expect(sut.radioButton.isSelected).to(equal(true))
                }

                it("starts unselected") {
                    sut.configure(isSelected: false)
                    expect(sut.radioButton.isSelected).to(equal(false))
                }

                it("has no text") {
                    expect(sut.radioButton.text).to(beNil())
                }

                it("has text") {
                    sut.configure(text: "label text")
                    expect(sut.radioButton.labelComponent).to(equal("label text"))
                }

                it("is grouped") {
                    let group = [sut!]
                    expect(sut.radioButton.isGrouped).to(beFalse())
                    sut.configure(addToGroup: group)
                    expect(sut.radioButton.isGrouped).to(beTrue())
                }
            }
        }
    }
}
