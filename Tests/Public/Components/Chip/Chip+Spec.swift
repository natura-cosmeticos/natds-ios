import Quick
import Nimble

@testable import NatDS

final class ChipSpec: QuickSpec {

    override func spec() {
        var systemUnderTest: NatChip!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = NatChip()
        }

        describe("#init") {
            it("standard init") {
                expect(systemUnderTest.state).toEventually(equal(UIControl.State.normal))
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
            context(".selected") {
                beforeEach {
                    systemUnderTest.configure(state: .selected)
                }

                it("state selected") {
                    expect(systemUnderTest.state).toEventually(equal(UIControl.State.selected))
                }
            }
            context("default") {
                beforeEach {
                    systemUnderTest.configure(state: .highlighted)
                }

                it("state normal") {
                    expect(systemUnderTest.state).toEventually(equal(UIControl.State.normal))
                }

                beforeEach {
                    systemUnderTest.configure(state: .application)
                }

                it("state normal") {
                    expect(systemUnderTest.state).toEventually(equal(UIControl.State.normal))
                }
            }
        }
    }
}
