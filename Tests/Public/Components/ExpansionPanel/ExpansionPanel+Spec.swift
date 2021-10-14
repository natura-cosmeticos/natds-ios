import Quick
import Nimble

@testable import NatDS

final class ExpansionPanelTests: QuickSpec {

    override func spec() {
        var sut: ExpansionPanel!
        var actionInvocations = 0

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            sut = ExpansionPanel()
            actionInvocations = 0
        }

        describe("#init()") {
            it("has no title") {
                let title = sut.subviews.first as? UILabel

                expect(title?.text).to(beNil())
            }

            it("has no completion handler") {
                expect(actionInvocations).to(equal(0))
            }
        }

        describe("#setSubtitle()") {
            beforeEach {
                sut.setSubtitle("Subtitle")
            }

            it("has expected subtitle") {
                let title = sut.subviews.first as? UILabel

                expect(title?.text).to(equal("Subtitle"))
            }
        }

        describe("#setHandlerForTap(.expand)") {
            beforeEach {
                sut.setHandlerForTap(withAction: .expand) {
                    actionInvocations += 1
                }
            }

            context("when expansion panel is collapsed, receives tap and expands") {
                beforeEach {
                    sut.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("runs the completion handler") {
                    expect(actionInvocations).toEventually(equal(1))
                }
            }
        }

        describe("#setHandlerForTap(.collapse)") {
            beforeEach {
                sut.setHandlerForTap(withAction: .collapse) {
                    actionInvocations += 1
                }
                sut.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
            }

            context("when expansion panel is expanded, receives tap and collapses") {
                beforeEach {
                    sut.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("runs the completion handler") {
                    expect(actionInvocations).toEventually(equal(1))
                }
            }
        }

        describe("#setHandlerForTap(.allActions)") {
            beforeEach {
                sut.setHandlerForTap(withAction: .allActions) {
                    actionInvocations += 1
                }
            }

            context("when expansion panel receives any tap, for expanding or collapsing") {
                beforeEach {
                    sut.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("runs the completion handler") {
                    expect(actionInvocations).toEventually(equal(1))
                }
            }
        }
    }
}
