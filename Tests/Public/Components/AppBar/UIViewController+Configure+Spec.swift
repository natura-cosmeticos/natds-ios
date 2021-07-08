import Nimble
import Quick

@testable import NatDS

final class UIViewControllerConfigureSpec: QuickSpec {
    override func spec() {
        var sut: UIViewController!
        var actionInvocations: Int!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = NaturaDarkTheme()

            sut = UIViewController()
        }

        describe("#configure(appBarContentType:)") {
            context("when appBarContentType is .text") {
                beforeEach {
                    sut.configure(appBarContentType: .text("Title"))
                }
                it("sets navigationItem title") {
                    expect(sut.title).to(equal("Title"))
                }
                it("sets navigationItem titleView to nil") {
                    expect(sut.navigationItem.titleView).to(beNil())
                }
            }

            context("when appBarContentType is .media") {
                beforeEach {
                    sut.configure(appBarContentType: .media(NatLogoImages.horizontal))
                }
                it("sets navigationItem titleView") {
                    expect(sut.navigationItem.titleView).toNot(beNil())
                }
                it("sets navigationItem titleView with logo") {
                    let logoImageView = sut.navigationItem.titleView as? UIImageView
                    let logoImage = logoImageView?.image

                    expect(logoImage).to(equal(NatLogoImages.horizontal))
                }
            }
        }

        describe("#configure(button:)") {
            var buttons: [UIBarButtonItem]!

            beforeEach {
                buttons = [UIBarButtonItem(), UIBarButtonItem()]
                sut.configure(buttons: buttons)
            }

            it("sets navigationItem right barButtonItems and spacing") {
                let expectedCount = (buttons.count * 2) + 1
                expect(sut.navigationItem.rightBarButtonItems?.count).to(equal(expectedCount))
            }
            it("sets NatSizes.tiny as spacing between navigationItem and navigationBar") {
                expect(sut.navigationItem.rightBarButtonItems?.first?.width).to(equal(NatSizes.tiny))
            }
            it("sets NatSizes.small as spacing between barButtonItems") {
                expect(sut.navigationItem.rightBarButtonItems?[2].width).to(equal(NatSizes.small))
            }
        }

        describe("#configure(actionLeft:)") {
            beforeEach {
                actionInvocations = 0
                let iconButton = NatIconButton(style: .standardDefault, size: .semi)
                iconButton.configure { actionInvocations += 1 }
                sut.configure(appBarActionLeft: iconButton)
                iconButton.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
            }

            it("sets left bar button item") {
                expect(sut.navigationItem.leftBarButtonItems?.count).to(equal(1))
            }
            it("stores action and uses it in tap events") {
                expect(actionInvocations).toEventually(equal(1))
            }
        }

        describe("#configure(actionRight:)") {
            context("when it has 1 action") {
                beforeEach {
                    actionInvocations = 0
                    let iconButton = NatIconButton(style: .standardDefault, size: .semi)
                    iconButton.configure { actionInvocations += 1 }
                    sut.configure(appBarActionRight: [iconButton])
                    iconButton.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("sets right bar button item") {
                    expect(sut.navigationItem.rightBarButtonItems?.count).to(equal(1))
                }
                it("stores action and uses it in tap events") {
                    expect(actionInvocations).toEventually(equal(1))
                }
            }
            context("when it has more than 1 action") {
                beforeEach {
                    actionInvocations = 0
                    let iconButton = NatIconButton(style: .standardDefault, size: .semi)
                    iconButton.configure { actionInvocations += 1 }
                    iconButton.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                    let nextIconButton = NatIconButton(style: .standardDefault, size: .semi)
                    nextIconButton.configure { actionInvocations += 1 }
                    sut.configure(appBarActionRight: [iconButton, nextIconButton])
                    nextIconButton.gestureRecognizers?.forEach { $0.sendGesturesEvents() }
                }

                it("sets two right bar button items") {
                    expect(sut.navigationItem.rightBarButtonItems?.count).to(equal(2))
                }
                it("stores actions and use them in tap events") {
                    expect(actionInvocations).toEventually(equal(2))
                }
            }
        }
    }
}
