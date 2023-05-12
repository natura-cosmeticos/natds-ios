import Quick
import Nimble

@testable import NatDS

final class NatCounterSpec: QuickSpec {

    override func spec() {
        var sut: NatCounter!
        var actionInvocations = 0

        describe("#init()") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()
                sut = NatCounter()
            }

            it("counter starts at 0") {
                expect(sut.numCounterTextField.text).to(equal("0"))
            }
        }

        describe("#configure(label:)") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()
                sut = NatCounter()
            }

            it("starts without text") {
                expect(sut.label.text).to(equal(""))
            }

            context("when a text is set") {
                beforeEach {
                    sut.configure(label: "Design System")
                }

                it("shows the text in the label") {
                    expect(sut.label.text).to(equal("Design System"))
                }
            }
        }

        describe("#configure(button: , state:) ") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()
                sut = NatCounter()
            }

            context("when subtract button state is set to disabled") {
                beforeEach {
                    sut.configure(button: .subtract, state: .disabled)
                }

                it("is not enabled") {
                    expect(sut.subtractView.isEnabled).to(beFalse())
                }
            }

            context("when add button state is set to disabled") {
                beforeEach {
                    sut.configure(button: .add, state: .disabled)
                }

                it("is not enabled") {
                    expect(sut.addView.isEnabled).to(beFalse())
                }
            }

            context("when all buttons states are set to disabled") {
                beforeEach {
                    sut.configure(button: .all, state: .disabled)
                }

                it("all buttons are not enabled") {
                    expect(sut.addView.isEnabled).to(beFalse())
                    expect(sut.subtractView.isEnabled).to(beFalse())
                }
            }

            context("when subtract button state is set to enabled") {
                beforeEach {
                    sut.configure(button: .subtract, state: .enabled)
                }

                it("is enabled") {
                    expect(sut.subtractView.isEnabled).to(beTrue())
                }
            }

            context("when add button state is set to enabled") {
                beforeEach {
                    sut.configure(button: .add, state: .enabled)
                }

                it("is enabled") {
                    expect(sut.addView.isEnabled).to(beTrue())
                }
            }

            context("when all buttons states are set to enabled") {
                beforeEach {
                    sut.configure(button: .all, state: .enabled)
                }

                it("all buttons are enabled") {
                    expect(sut.addView.isEnabled).to(beTrue())
                    expect(sut.subtractView.isEnabled).to(beTrue())
                }
            }
        }

        describe("#configure(changeValue:)") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()
                sut = NatCounter()
            }

            context("when value is changed by adding") {
                beforeEach {
                    actionInvocations = 0
                    sut.configure { _ in actionInvocations += 1 }
                    sut.addView.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("stores action and uses it in change value events") {
                    expect(actionInvocations).toEventually(equal(1))
                }
            }

            context("when value is changed by subtracting") {
                beforeEach {
                    actionInvocations = 0
                    sut.configure { _ in actionInvocations += 1 }
                    sut.setCount(1)
                    sut.subtractView.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("stores action and uses it in change value events") {
                    expect(actionInvocations).toEventually(equal(1))
                }
            }
        }

        describe("#setCount:)") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()
                sut = NatCounter()
            }

            context("when value is set for the component") {
                beforeEach {
                    sut.setCount(1)
                    actionInvocations = 0
                    sut.configure { _ in actionInvocations += 1 }
                }

                it("shows the set value") {
                    expect(sut.numCounterTextField.text).to(equal("1"))
                }

                it("doesn't run the value change handler") {
                    expect(actionInvocations).to(equal(0))
                }
            }
        }
    }
}
