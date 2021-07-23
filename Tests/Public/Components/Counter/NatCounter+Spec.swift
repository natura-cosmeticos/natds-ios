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

            it("size default") {
                sut = NatCounter()
                expect(sut.size.value).to(equal(NatSizes.semi))
            }

            it("size semi") {
                sut = NatCounter(size: .semi)
                expect(sut.size.value).to(equal(NatSizes.semi))
            }

            it("size medium") {
                sut = NatCounter(size: .medium)
                expect(sut.size.value).to(equal(NatSizes.medium))
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
                    let state = NatCounter.State.self
                    sut.configure(button: .subtract, state: .disabled)
                    expect(sut.subtractView.isEnabled).to(beFalse())
                }

                it("when add button is disabled") {
                    let state = NatCounter.State.self
                    sut.configure(button: .add, state: .disabled)
                    expect(sut.addView.isEnabled).to(beFalse())
                }

                it("when all buttons are disabled") {
                    let state = NatCounter.State.self
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
                    let state = NatCounter.State.self
                    sut.configure(button: .subtract, state: .enabled)
                    expect(sut.subtractView.isEnabled).to(beTrue())
                }

                it("when add button is enabled") {
                    let state = NatCounter.State.self
                    sut.configure(button: .add, state: .enabled)
                    expect(sut.addView.isEnabled).to(beTrue())
                }

                it("when all buttons are enabled") {
                    let state = NatCounter.State.self
                    sut.configure(button: .all, state: .enabled)
                    expect(sut.addView.isEnabled).to(beTrue())
                    expect(sut.subtractView.isEnabled).to(beTrue())
                }
            }
        }
    }
}
