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

        describe("#configure(primaryButtonTitle: String, withAction: @escaping () -> Void)") {
            beforeEach {
                _ = systemUnderTest.configure(primaryButtonTitle: "StubText") {}
            }

            it("does not set titleView") {
                expect(viewModel.titleView).to(beNil())
            }

            it("does not set bodyView") {
                expect(viewModel.bodyView).to(beNil())
            }

            it("sets footerView") {
                expect(viewModel.footerView).toNot(beNil())
            }

            it("sets only one button at footerView") {
                let stackView = viewModel.footerView?.subviews.first

                expect(stackView?.subviews.count).to(equal(1))
            }

            it("sets a primary button at footerView") {
                let stackView = viewModel.footerView?.subviews.first
                let expectedView = stackView?.subviews.first as? NatButton

                expect(expectedView).toNot(beNil())
            }
        }

        describe("#configure(secondaryButtonTitle: String, withAction: @escaping () -> Void)") {
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
            }

            context("setting primary button first") {
                beforeEach {
                    _ = systemUnderTest.configure(primaryButtonTitle: "StubText") {}
                    _ = systemUnderTest.configure(secondaryButtonTitle: "StubText") {}
                }

                it("does not set titleView") {
                    expect(viewModel.titleView).to(beNil())
                }

                it("does not set bodyView") {
                    expect(viewModel.bodyView).to(beNil())
                }

                it("has footerView already set") {
                    expect(viewModel.footerView).toNot(beNil())
                }

                it("sets a second button at footerView") {
                    let stackView = viewModel.footerView?.subviews.first

                    expect(stackView?.subviews.count).to(equal(2))
                }

                it("sets a secondary button at footerView") {
                    let stackView = viewModel.footerView?.subviews.first
                    let expectedView = stackView?.subviews.last as? NatButton

                    expect(expectedView).toNot(beNil())
                }
            }
        }
    }
}
