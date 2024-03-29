import Quick
import Nimble

@testable import NatDS

final class NatIconButtonSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatIconButton!

        var applyStyleInvocations: Int!
        var notificationCenterSpy: NotificationCenterSpy!
        var styleSpy: NatIconButton.Style!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            applyStyleInvocations = 0

            notificationCenterSpy = .init()

            styleSpy = .init(applyStyle: { _ in applyStyleInvocations += 1 })

            systemUnderTest = .init(style: styleSpy, size: .semi, notificationCenter: notificationCenterSpy)
        }

        describe("#init") {
            it("applies style only once") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("has only one sublayers: IconView") {
                expect(systemUnderTest.layer.sublayers?.count).to(equal(1))
            }

            it("calls notificationCenter.addObserver only once") {
                expect(notificationCenterSpy.addObserverInvocations).to(equal(1))
            }

            it("registers to expected notification event without passing objects") {
                expect(notificationCenterSpy.invokedAddObserver?.name).to(equal(.themeHasChanged))
                expect(notificationCenterSpy.invokedAddObserver?.object).to(beNil())
            }
        }

        describe("#currentState") {
            context("when is enabled") {
                beforeEach {
                    systemUnderTest.configure(state: .enabled)
                }

                it("returns an expected value") {
                    expect(systemUnderTest.currentState).to(equal(.enabled))
                }
            }

            context("when is disabled") {
                beforeEach {
                    systemUnderTest.configure(state: .disabled)
                }

                it("returns an expected value") {
                    expect(systemUnderTest.currentState).to(equal(.disabled))
                }
            }
        }

        describe("#configure(action:)") {
            var actionInvocations: Int!

            context("when is enabled") {
                beforeEach {
                    actionInvocations = 0
                    systemUnderTest.configure(delegate: self) { _ in
                        actionInvocations += 1
                    }
                    systemUnderTest.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("stores action and uses it in tap events") {
                    expect(actionInvocations).toEventually(equal(1))
                }
            }

            context("when is disabled") {
                beforeEach {
                    actionInvocations = 0
                    systemUnderTest.configure(action: { actionInvocations += 1 })
                    systemUnderTest.configure(state: .disabled)
                    systemUnderTest.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("stores action and uses it in tap events") {
                    expect(actionInvocations).toEventually(equal(0))
                }
            }
        }

        describe("#configure(badgeValue:)") {
            context("when value is bigger than 0") {
                beforeEach {
                    let badge = NatBadge(style: .standard, color: .alert)
                    badge.configure(count: 10)
                    systemUnderTest.configure(badge: badge)
                }

                it("adds sublayer for badge") {
                    expect(systemUnderTest.layer.sublayers?.count).to(equal(2))
                }
            }

            context("when value is 0") {
                beforeEach {
                    let badge = NatBadge(style: .standard, color: .alert)
                    badge.configure(count: 0)
                    systemUnderTest.configure(badge: badge)
                }

                it("removes sublayer for badge if exists") {
                    expect(systemUnderTest.layer.sublayers?.count).to(equal(1))
                }
            }

            context("when value is bigger than 0 then a 0 value") {
                beforeEach {
                    let badge = NatBadge(style: .standard, color: .alert)
                    badge.configure(count: 10)
                    badge.configure(count: 0)
                    systemUnderTest.configure(badge: badge)
                }

                it("removes sublayer for badge") {
                    expect(systemUnderTest.layer.sublayers?.count).to(equal(1))
                }
            }
        }

        describe("#configure(icon:)") {
            beforeEach {
                systemUnderTest.configure(icon: nil)
            }

            it("returns an expected value") {
                let iconView = systemUnderTest.subviews.first as? IconView

                expect(iconView?.defaultImageView.isHidden).to(beFalse())
            }
        }

        describe("#configure(iconImage:)") {
            beforeEach {
                systemUnderTest.configure(iconImage: AssetsPath.iconOutlinedActionVisibility.rawValue)
            }

            it("returns an expected value") {
                let iconView = systemUnderTest.subviews.first as? IconView

                expect(iconView?.defaultImageView.image).to(equal(AssetsPath.iconOutlinedActionVisibility.rawValue))
            }
        }

        describe("#configure(iconColor:)") {
            beforeEach {
                systemUnderTest.configure(iconColor: .red)
            }

            it("returns an expected value") {
                let iconView = systemUnderTest.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(.red))
            }
        }

        describe("#configure(state:)") {
            context("when is enabled") {
                beforeEach {
                    systemUnderTest.configure(state: .enabled)
                }

                it("applies style for the second time") {
                    expect(applyStyleInvocations).to(equal(2))
                }
            }

            context("when is disabled") {
                beforeEach {
                    systemUnderTest.configure(state: .disabled)
                }

                it("applies style for the second time") {
                    expect(applyStyleInvocations).to(equal(2))
                }
            }
        }

        describe("#configure(background:)") {
            context("when is set to overlay") {
                beforeEach {
                    systemUnderTest.configure(background: .overlay)
                }

                it("applies style for the second time") {
                    expect(applyStyleInvocations).to(equal(2))
                }
            }

            context("when is set to float") {
                beforeEach {
                    systemUnderTest.configure(background: .float)
                }

                it("applies style for the second time") {
                    expect(applyStyleInvocations).to(equal(2))
                }
            }
        }

        describe("#touchesBegan") {
            beforeEach {
                systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)
            }

            it("applies style only on init") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("calls beginPulseAt and sublayer for animation is add") {
                expect(systemUnderTest.layer.sublayers?.count).to(equal(2))
            }
        }

        describe("#touchesEnded") {
            beforeEach {
                systemUnderTest.touchesBegan(.init(arrayLiteral: .init()), with: nil)
                systemUnderTest.touchesEnded(.init(), with: nil)
            }

            it("applies style only on init") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("calls endPulse and sublayer is removed after animation ends") {
                expect(systemUnderTest.layer.sublayers?.count).toEventually(equal(1))
            }
        }

        context("When a notification of .themeHasChange is received") {
            beforeEach {
                applyStyleInvocations = 0

                notificationCenterSpy = .init()

                styleSpy = .init(applyStyle: { _ in applyStyleInvocations += 1 })
                systemUnderTest = .init(style: styleSpy)

                NotificationCenter.default.post(name: .themeHasChanged, object: nil)
            }

            it("applies style for the second time") {
                expect(applyStyleInvocations).to(equal(2))
            }
        }
    }
}
