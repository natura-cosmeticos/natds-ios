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
                let expectedView = stackView?.subviews.first as? NatDialogController.TitleView

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
                let expectedView = stackView?.subviews.first as? NatDialogController.BodyView

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

        describe("#configure(primaryTitle: String, primaryAction: @escaping () -> Void)") {
            beforeEach {
                natDialogController = systemUnderTest
                    .configure(primaryTitle: "StubText") { }
                    .build()
            }

            it("sets footerView") {
                let containerView = natDialogController.view.subviews.first
                let stackView = containerView?.subviews.first
                let expectedView = stackView?.subviews.first as? NatDialogController.FooterView

                expect(expectedView).toNot(beNil())
            }
        }

        describe("#configure(primaryTitle: String, primaryAction: @escaping () -> Void)") {
            beforeEach {
                natDialogController = systemUnderTest
                    .configure(secondaryTitle: "StubText") { }
                    .build()
            }

            it("only sets footerView if has a primaryButtonConfiguration") {
                let containerView = natDialogController.view.subviews.first
                let stackView = containerView?.subviews.first
                let expectedView = stackView?.subviews.first as? NatDialogController.FooterView
                expect(expectedView).to(beNil())
            }
        }
    }
}
