import Quick
import Nimble

@testable import NatDS

final class SelectionControlRadioButtonSpec: QuickSpec {

    override func spec() {
        var sut: NatSelectionControl!

        describe("#init") {
            context("when it starts without text") {
                beforeEach {
                    ConfigurationStorage.shared.currentTheme = StubTheme()

                    sut = .init(style: .radioButton, text: nil)
                }

                it("starts enabled") {
                    expect(sut.isEnabled).to(equal(true))
                }

                it("starts unselected") {
                    expect(sut.isSelected).to(equal(false))
                }

                it("has no text") {
                    expect(sut.text).to(beNil())
                }
            }

            context("when it starts with text") {
                beforeEach {
                    ConfigurationStorage.shared.currentTheme = StubTheme()

                    sut = .init(style: .radioButton, text: "label text")
                }

                it("starts enabled") {
                    expect(sut.isEnabled).to(equal(true))
                }

                it("starts unselected") {
                    expect(sut.isSelected).to(equal(false))
                }

                it("has text") {
                    expect(sut.text).to(equal("label text"))
                }
            }
        }
    }
}
