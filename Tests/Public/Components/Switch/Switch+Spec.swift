import Quick
import Nimble

@testable import NatDS

final class SwitchSpec: QuickSpec {

    override func spec() {
        var systemUnderTest: NatSwitch!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = NatSwitch()
        }

        describe("#init") {
            it("starts state normal") {
                expect(systemUnderTest.state).toEventually(equal(UIControl.State.normal))
            }

            it("starts off") {
                expect(systemUnderTest.isOn).to(beFalse())
            }
        }

        describe("#configure(state:)") {
            context(".normal") {
                beforeEach {
                    systemUnderTest.configure(state: .normal)
                }

                it("state normal") {
                    expect(systemUnderTest.state).toEventually(equal(UIControl.State.normal))
                }
            }
            context(".focused") {
                beforeEach {
                    systemUnderTest.configure(state: .focused)
                }

                it("state focused") {
                    expect(systemUnderTest.state).toEventually(equal(UIControl.State.focused))
                }
            }
            context(".disabled") {
                beforeEach {
                    systemUnderTest.configure(state: .disabled)
                }

                it("state disabled") {
                    expect(systemUnderTest.state).toEventually(equal(UIControl.State.disabled))
                }
            }
        }

        describe("#configure(isOn:)") {
            context("false") {
                beforeEach {
                    systemUnderTest.configure(isOn: false)
                }

                it("is off") {
                    expect(systemUnderTest.isOn).to(beFalse())
                }
            }
            context("true") {
                beforeEach {
                    systemUnderTest.configure(isOn: true)
                }

                it("is on") {
                    expect(systemUnderTest.isOn).to(beTrue())
                }
            }
        }

    }
}
