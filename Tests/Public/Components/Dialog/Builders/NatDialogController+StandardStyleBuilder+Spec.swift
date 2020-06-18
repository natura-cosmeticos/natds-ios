import Quick
import Nimble

@testable import NatDS

final class NatDialogControllerStandardStyleBuilderSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatDialogController.StandardStyleBuilder!
        var natDialogController: NatDialogController!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            systemUnderTest = .init()
        }

        describe("#configure(title: String)") {
            beforeEach {
                natDialogController = systemUnderTest
                    .configure(title: "StubText")
                    .build()
            }

            it("sets titleView") {

                let containerView = natDialogController.view.subviews.first
                let stackView = containerView?.subviews.first
                let expectedView = stackView?.subviews.first as? DialogStandardStyle.TitleView

                expect(expectedView).toNot(beNil())
            }
        }

        describe("#configure(body: String)") {
            beforeEach {
                natDialogController = systemUnderTest
                    .configure(body: "StubText")
                    .build()
            }

            it("sets bodyView") {
                let containerView = natDialogController.view.subviews.first
                let stackView = containerView?.subviews.first
                let expectedView = stackView?.subviews.first as? DialogStandardStyle.BodyView

                expect(expectedView).toNot(beNil())
            }
        }

        describe("#configure(body: UIView)") {
            let stubView = UIView()

            beforeEach {
                natDialogController = systemUnderTest
                    .configure(body: stubView)
                    .build()
            }

            it("sets bodyView") {
                let containerView = natDialogController.view.subviews.first
                let stackView = containerView?.subviews.first
                let expectedView = stackView?.subviews.first

                expect(expectedView).to(equal(stubView))
            }
        }

        describe("#configure(primaryButtonTitle: String, withAction: @escaping () -> Void)") {
            beforeEach {
                natDialogController = systemUnderTest
                    .configure(primaryButtonTitle: "StubText") { }
                    .build()
            }

            it("sets footerView") {
                let containerView = natDialogController.view.subviews.first
                let stackView = containerView?.subviews.first
                let expectedView = stackView?.subviews.first as? DialogStandardStyle.FooterView

                expect(expectedView).toNot(beNil())
            }
        }

        describe("#configure(secondaryButtonTitle: String, withAction: @escaping () -> Void)") {
            beforeEach {
                natDialogController = systemUnderTest
                    .configure(secondaryButtonTitle: "StubText") { }
                    .build()
            }

            it("sets footerView only if has a primaryButtonConfiguration seted first") {
                let containerView = natDialogController.view.subviews.first
                let stackView = containerView?.subviews.first
                let expectedView = stackView?.subviews.first as? DialogStandardStyle.FooterView

                expect(expectedView).to(beNil())
            }
        }
    }
}
