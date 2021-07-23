import Quick
import Nimble

@testable import NatDS

final class NatCounterSpec: QuickSpec {

    override func spec() {
        var sut: NatCounter!

        describe("#init()") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()
            }

            it("counter starts at 0") {
                sut = NatCounter()
                expect(sut.numCounterLabel.text).to(equal("0"))
            }
        }

        describe("#configure(label:)") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()

                sut = NatCounter()
            }

            it("when it starts without text") {
                expect(sut.label.text).to(equal(""))
            }

            it("when it starts with a text") {
                sut.configure(label: "Design System")
                expect(sut.label.text).to(equal("Design System"))
            }
        }

        describe("#configure(button: , state:) ") {
            context(".disabled") {
                beforeEach {
                    ConfigurationStorage.shared.currentTheme = StubTheme()

                    sut = NatCounter()
                }

                it("when subtract button is disabled") {
                    sut.configure(button: .subtract, state: .disabled)
                    expect(sut.subtractView.isEnabled).to(beFalse())
                }

                it("when add button is disabled") {
                    sut.configure(button: .add, state: .disabled)
                    expect(sut.addView.isEnabled).to(beFalse())
                }

                it("when all buttons are disabled") {
                    sut.configure(button: .all, state: .disabled)
                    expect(sut.addView.isEnabled).to(beFalse())
                    expect(sut.subtractView.isEnabled).to(beFalse())
                }
            }

            context(".enabled") {
                beforeEach {
                    ConfigurationStorage.shared.currentTheme = StubTheme()

                    sut = NatCounter()
                }

                it("when subtract button is enabled") {
                    sut.configure(button: .subtract, state: .enabled)
                    expect(sut.subtractView.isEnabled).to(beTrue())
                }

                it("when add button is enabled") {
                    sut.configure(button: .add, state: .enabled)
                    expect(sut.addView.isEnabled).to(beTrue())
                }

                it("when all buttons are enabled") {
                    sut.configure(button: .all, state: .enabled)
                    expect(sut.addView.isEnabled).to(beTrue())
                    expect(sut.subtractView.isEnabled).to(beTrue())
                }
            }
        }
    }
}
