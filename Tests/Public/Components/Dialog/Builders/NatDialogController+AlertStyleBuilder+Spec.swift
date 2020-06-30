import Quick
import Nimble

@testable import NatDS

final class NatDialogControllerAlertStyleBuilderSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatDialogController.AlertStyleBuilder!
        var viewModel: NatDialogController.ViewModel!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            systemUnderTest = .init()
            viewModel = systemUnderTest.viewModel
        }

        describe("#init") {
            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
            }

            it("does not set bodyView") {
                expect(viewModel.bodyView).to(beNil())
            }

            it("does not set footerView") {
                expect(viewModel.footerView).to(beNil())
            }

            it("has protocol NatDialogTitleConfigurator") {
                let systemUnderTest: Any? = systemUnderTest

                expect(systemUnderTest as? NatDialogTitleConfigurator).toNot(beNil())
            }

            it("has protocol NatDialogBodyConfigurator") {
                let systemUnderTest: Any? = systemUnderTest

                expect(systemUnderTest as? NatDialogBodyConfigurator).toNot(beNil())
            }

            it("has protocol NatDialogDismissableConfigurator") {
                let systemUnderTest: Any? = systemUnderTest

                expect(systemUnderTest as? NatDialogDismissableConfigurator).toNot(beNil())
            }
        }

        describe("#configure(primaryButtonTitle: withAction:)") {
            beforeEach {
                _ = systemUnderTest.configure(primaryButtonTitle: "StubText") {}
            }

            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
            }

            it("does not set bodyView") {
                expect(viewModel.bodyView).to(beNil())
            }

            it("does not set footerView") {
                expect(viewModel.footerView).to(beNil())
            }

            it("does not set footerView") {
                expect(viewModel.footerView).to(beNil())
            }

            it("sets primary button configuration") {
                expect(systemUnderTest.buttonsConfiguration.primary).toNot(beNil())
            }

            it("does not set secondary button configuration") {
                expect(systemUnderTest.buttonsConfiguration.secondary).to(beNil())
            }
        }

        describe("#configure(secondaryButtonTitle: withAction:)") {
            context("without set primary button first") {
                beforeEach {
                    _ = systemUnderTest.configure(secondaryButtonTitle: "StubText") {}
                }

                it("does not set titleView") {
                    expect(viewModel.titleView).to(beNil())
                }

                it("does not set bodyView") {
                    expect(viewModel.bodyView).to(beNil())
                }

                it("does not set footerView") {
                    expect(viewModel.footerView).to(beNil())
                }

                it("does not set primary button configuration") {
                    expect(systemUnderTest.buttonsConfiguration.primary).to(beNil())
                }

                it("sets secondary button configuration") {
                    expect(systemUnderTest.buttonsConfiguration.secondary).toNot(beNil())
                }
            }
        }
    }
}
