import Quick
import Nimble

@testable import NatDS

final class NatShortSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatShortcut!

        var applyStyleInvocations: Int!
        var styleSpy: NatShortcut.Style!
        var notificationCenterSpy: NotificationCenterSpy!

        let badge = NatBadge(style: .standard, color: .alert)

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            applyStyleInvocations = 0

            styleSpy = .init(
                applyStyle: { _ in applyStyleInvocations += 1 }
            )

            notificationCenterSpy = .init()
            systemUnderTest = .init(style: styleSpy, color: .primary, text: nil,
                                    icon: nil, notificationCenter: notificationCenterSpy)
        }

        describe("#init") {
            it("applies style only once") {
                expect(applyStyleInvocations).to(equal(1))
            }

            it("sets a default icon") {
                let shortcutView = systemUnderTest.subviews.first
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.defaultImageView.isHidden).to(beFalse())
            }

            it("calls notificationCenter.addObserver only once") {
                expect(notificationCenterSpy.addObserverInvocations).to(equal(1))
            }

            it("registers to expected notification event without passing objects") {
                expect(notificationCenterSpy.invokedAddObserver?.name).to(equal(.themeHasChanged))
                expect(notificationCenterSpy.invokedAddObserver?.object).to(beNil())
            }

            it("assures that the gestureRecognizer is UITapGestureRecognizer") {
                let tapped = systemUnderTest.gestureRecognizers?.first { $0 is UITapGestureRecognizer }

                expect(tapped).toNot(beNil())
            }

            it("assures that the gestureRecognizer is UILongPressGestureRecognizer") {
                let longPressed = systemUnderTest.gestureRecognizers?.first { $0 is UILongPressGestureRecognizer }

                expect(longPressed).toNot(beNil())
            }
        }

        describe("#configure(text:)") {
            beforeEach {
                systemUnderTest.configure(text: "stub text")
            }

            it("sets text to label") {
                let label = systemUnderTest.subviews
                    .compactMap { $0 as? UILabel }
                    .first

                expect(label?.text).to(equal("stub text"))
            }
        }

        describe("#configure(icon:)") {
            beforeEach {
                systemUnderTest.configure(icon: nil)
            }

            it("sets icon to iconView") {
                let shortcutView = systemUnderTest.subviews.first
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.defaultImageView.isHidden).to(beFalse())
            }
        }

        describe("#configure(circleColor:)") {
            beforeEach {
                systemUnderTest.configure(circleColor: .red)
            }

            it("sets background color to circleView") {
                let circleView = systemUnderTest.subviews.first

                expect(circleView?.backgroundColor).to(equal(.red))
            }
        }

        describe("#configure(circleBorderWidth:)") {
            beforeEach {
                systemUnderTest.configure(circleBorderWidth: 2.5)
            }

            it("sets border width to circleView") {
                let circleView = systemUnderTest.subviews.first

                expect(circleView?.layer.borderWidth).to(equal(2.5))
            }
        }

        describe("#configure(circleBorderColor:)") {
            beforeEach {
                systemUnderTest.configure(circleBorderColor: UIColor.red.cgColor)
            }

            it("sets border color to circleView") {
                let circleView = systemUnderTest.subviews.first

                expect(circleView?.layer.borderColor).to(equal(UIColor.red.cgColor))
            }
        }

        describe("#configure(iconColor:)") {
            beforeEach {
                systemUnderTest.configure(iconColor: UIColor.red)
            }

            it("sets tintColor to iconView") {
                let shortcutView = systemUnderTest.subviews.first
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(.red))
            }
        }

        describe("#configure(action:)") {
            var actionInvocations = 0

            beforeEach {
                systemUnderTest.configure(action: { actionInvocations += 1 })
                systemUnderTest.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
            }

            it("stores action and uses it in tap events") {
                expect(actionInvocations).toEventually(equal(1))
            }
        }

        describe("#configure(delegate:action:)") {
            var actionInvocations = 0

            beforeEach {
                systemUnderTest.configure(delegate: self) { _ in
                    actionInvocations += 1
                }
                systemUnderTest.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
            }

            it("stores action and uses it in tap events") {
                expect(actionInvocations).toEventually(equal(1))
            }
        }

        describe("#configure(state:)") {
            var actionInvocations = 0

            beforeEach {
                systemUnderTest.configure(state: .disabled)
                systemUnderTest.configure(action: { actionInvocations += 1 })
                systemUnderTest.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
            }

            it("does not perform action") {
                expect(actionInvocations).to(equal(0))
            }
        }

        describe("#configure(badgeValue:)") {
            context("when value is bigger than 0") {
                beforeEach {
                    badge.configure(count: 10)
                    systemUnderTest.configure(badge: badge)
                }

                it("adds sublayer for badge") {
                    let helperView = systemUnderTest.subviews
                        .compactMap { $0 as? HelperView }
                        .first

                    expect(helperView?.subviews.count).to(equal(1))
                }
            }

            context("when value is 0") {
                beforeEach {
                    badge.configure(count: 0)
                    systemUnderTest.configure(badge: badge)
                }

                it("removes sublayer for badge if exists") {
                    let helperView = systemUnderTest.subviews
                        .compactMap { $0 as? HelperView }
                        .first
                    expect(helperView?.subviews.count).to(equal(0))
                }
            }

            context("when value is bigger than 0 then a 0 value") {
                beforeEach {
                    badge.configure(count: 10)
                    badge.configure(count: 0)
                    systemUnderTest.configure(badge: badge)
                }

                it("removes sublayer for badge") {
                    let helperView = systemUnderTest.subviews
                        .compactMap { $0 as? HelperView }
                        .first
                    expect(helperView?.subviews.count).to(equal(0))
                }
            }
        }

        describe("#tapHandler") {
            beforeEach {
                systemUnderTest.tapHandler(.init())
            }

            it("calls addPulseLayerAnimated and sublayer for animation is add") {
                let circleView = systemUnderTest.subviews.first

                expect(circleView?.layer.sublayers?.count).to(equal(2))
            }

            it("calls removePulseLayer and sublayer is removed after animation ends") {
                let circleView = systemUnderTest.subviews.first

                expect(circleView?.layer.sublayers?.count).toEventually(equal(1))
            }
        }

        describe("#LongPressHandler") {
            beforeEach {
                let gestureBegan = UILongPressGestureRecognizer()
                gestureBegan.state = .began
                systemUnderTest.longPressHandler(gestureBegan)

                let gestureEnded = UILongPressGestureRecognizer()
                gestureEnded.state = .ended
                systemUnderTest.longPressHandler(gestureEnded)
            }

            it("calls addPulseLayerAnimated and sublayer for animation is add") {
                let circleView = systemUnderTest.subviews.first

                expect(circleView?.layer.sublayers?.count).to(equal(2))
            }

            it("calls removePulseLayer and sublayer is removed after animation ends") {
                let circleView = systemUnderTest.subviews.first

                expect(circleView?.layer.sublayers?.count).toEventually(equal(1))
            }
        }

        context("When a notification of .themeHasChange is received") {
            beforeEach {
                applyStyleInvocations = 0
                styleSpy = .init(
                    applyStyle: { _ in applyStyleInvocations += 1 }
                )
                systemUnderTest = .init(style: styleSpy)

                NotificationCenter.default.post(name: .themeHasChanged, object: nil)
            }

            it("applies style again besides init") {
                expect(applyStyleInvocations).to(equal(2))
            }
        }
    }
}
