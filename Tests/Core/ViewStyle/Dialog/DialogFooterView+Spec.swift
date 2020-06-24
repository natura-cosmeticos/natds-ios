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

        describe("#configureconfigure(primaryButton:)") {
            beforeEach {
                let configuration = DialogFooterView.ButtonConfiguration(
                    title: "StubText",
                    style: .contained,
                    action: {}
                )
                systemUnderTest.configure(primaryButton: configuration)
            }

            it("sets a button to stackView") {
                let expectedView = systemUnderTest.subviews.first as? UIStackView

                expect(expectedView?.subviews.count).to(equal(1))
            }
        }

        describe("#configureconfigure(secondaryButton:)") {
            beforeEach {
                let configuration = DialogFooterView.ButtonConfiguration(
                    title: "StubText",
                    style: .contained,
                    action: {}
                )
                systemUnderTest.configure(secondaryButton: configuration)
            }

            it("sets a button to stackView") {
                let expectedView = systemUnderTest.subviews.first as? UIStackView

                expect(expectedView?.subviews.count).to(equal(1))
            }
        }
    }
}
