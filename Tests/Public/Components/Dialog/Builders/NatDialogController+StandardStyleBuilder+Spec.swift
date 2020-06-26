import Quick
import Nimble

@testable import NatDS

final class NatDialogControllerStandardStyleBuilderSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatDialogController.StandardStyleBuilder!
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
        }

        describe("#configure(title: String)") {
            beforeEach {
                _ = systemUnderTest.configure(title: "StubText")
            }

            it("sets titleView") {
                expect(viewModel.titleView).toNot(beNil())
            }

            it("does not set bodyView") {
                expect(viewModel.bodyView).to(beNil())
            }

            it("does not set footerView") {
                expect(viewModel.footerView).to(beNil())
            }
        }

        describe("#configure(body: String)") {
            beforeEach {
                _ = systemUnderTest.configure(body: "StubText")
            }

            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
            }

            it("sets bodyView") {
                expect(viewModel.bodyView).toNot(beNil())
            }

            it("does not set footerView") {
                expect(viewModel.footerView).to(beNil())
            }
        }

        describe("#configure(body: UIView)") {
            let stubView = UIView()

            beforeEach {
                _ = systemUnderTest.configure(body: stubView)
            }

            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
            }

            it("sets bodyView") {
                expect(viewModel.bodyView).toNot(beNil())
            }

            it("sets bodyView to an expected view") {
                let expectedView = systemUnderTest.viewModel.bodyView

                expect(expectedView).to(equal(stubView))
            }

            it("does not set footerView") {
                expect(viewModel.footerView).to(beNil())
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
