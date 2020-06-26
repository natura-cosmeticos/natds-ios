import Quick
import Nimble

@testable import NatDS

final class DialogFooterViewSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: DialogFooterView!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            systemUnderTest = .init()
        }

        describe("#init") {
            it("sets as a stackView as subview") {
                let expectedView = systemUnderTest.subviews.first as? UIStackView

                expect(expectedView).toNot(beNil())
            }

            it("does not set any view to stackView") {
                let expectedView = systemUnderTest.subviews.first as? UIStackView

                expect(expectedView?.subviews.isEmpty).to(beTrue())
            }
        }

        describe("#configureconfigure(newButton:)") {
            context("when called once") {
                beforeEach {
                    let configuration = DialogButtonConfiguration(
                        title: "StubText",
                        style: .contained,
                        action: {}
                    )
                    systemUnderTest.configure(newButton: configuration)
                }

                it("sets a button to stackView") {
                    let expectedView = systemUnderTest.subviews.first as? UIStackView

                    expect(expectedView?.subviews.count).to(equal(1))
                }
            }

            context("when called mote than once") {
                beforeEach {
                    let configuration = DialogButtonConfiguration(
                        title: "StubText",
                        style: .contained,
                        action: {}
                    )
                    systemUnderTest.configure(newButton: configuration)
                    systemUnderTest.configure(newButton: configuration)
                    systemUnderTest.configure(newButton: configuration)
                }

                it("sets more than one button to stackView") {
                    let expectedView = systemUnderTest.subviews.first as? UIStackView

                    expect(expectedView?.subviews.count).to(equal(3))
                }
            }
        }
    }
}
