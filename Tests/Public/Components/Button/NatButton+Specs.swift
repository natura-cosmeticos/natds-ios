import Quick
import Nimble

@testable import NatDS

final class NatButtonSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatButton!

        var applyStyleInvocations: Int!
        var changeStateInvocations: Int!
        var applyTitleInvocations: Int!

        var styleSpy: NatButton.Style!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)

            applyStyleInvocations = 0
            changeStateInvocations = 0
            applyTitleInvocations = 0

            styleSpy = NatButton.Style(
                applyStyle: { _ in applyStyleInvocations += 1 },
                changeState: { _ in changeStateInvocations += 1 },
                applyTitle: { _, _ in applyTitleInvocations += 1 }
            )

            systemUnderTest = NatButton(style: styleSpy)
        }

        describe("#init") {
            it("apply style only once") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("does not call changeState") {
                expect(changeStateInvocations).to(equal(0))
            }

            it("does not call applyTitle") {
                expect(applyTitleInvocations).to(equal(0))
            }

            it("has nil sublayers") {
                expect(systemUnderTest.layer.sublayers).to(beNil())
            }
        }

        describe("#isEnabled") {
            context("when is eneable is True") {
                beforeEach {
                    systemUnderTest.isEnabled = true
                }

                it("apply style only on init") {
                    expect(applyStyleInvocations).to(equal(1))
                }

                it("calls changeState only once") {
                    expect(changeStateInvocations).to(equal(1))
                }

                it("does not call applytTitle") {
                    expect(applyTitleInvocations).to(equal(0))
                }
            }

            context("when is eneable is False") {
                beforeEach {
                    systemUnderTest.isEnabled = false
                }

                it("apply style only on init") {
                    expect(applyStyleInvocations).to(equal(1))
                }

                it("calls changeState only once") {
                    expect(changeStateInvocations).to(equal(1))
                }

                it("does not call applyTitle") {
                    expect(applyTitleInvocations).to(equal(0))
                }
            }
        }

        describe("#configure(title:)") {
            beforeEach {
                systemUnderTest.configure(title: "stub")
            }

            it("apply style only on init") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("does not call changeState") {
                expect(changeStateInvocations).to(equal(0))
            }

            it("calls applyTitle only once") {
                expect(applyTitleInvocations).to(equal(1))
            }
        }

        describe("#touchesBegan") {
            beforeEach {
                systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)
            }

            it("apply style only on init") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("does not call changeState") {
                expect(changeStateInvocations).to(equal(0))
            }

            it("does not call applyTitle") {
                expect(applyTitleInvocations).to(equal(0))
            }

            it("calls beginPulseAt and sublayer for animation is add") {
                expect(systemUnderTest.layer.sublayers?.count).to(equal(1))
            }
        }

        describe("#touchesEnded") {
            beforeEach {
                systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)
                systemUnderTest.touchesEnded(.init(), with: nil)
            }

            it("apply style only on init") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("does not call changeState") {
                expect(changeStateInvocations).to(equal(0))
            }

            it("does not call applyTitle") {
                expect(applyTitleInvocations).to(equal(0))
            }

            it("calls endPulse and sublayer is removed after animation ends") {
                expect(systemUnderTest.layer.sublayers?.count).toEventually(beNil())
            }
        }

        describe("#traitCollectionDidChange") {
            beforeEach {
                systemUnderTest.traitCollectionDidChange(nil)
            }

            it("apply style only on init") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("calls changeState only once") {
                expect(changeStateInvocations).to(equal(1))
            }

            it("does not call applyTitle") {
                expect(applyTitleInvocations).to(equal(0))
            }
        }
    }
}
