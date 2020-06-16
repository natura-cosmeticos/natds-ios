import Quick
import Nimble

@testable import NatDS

final class NatDialogControllerSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatDialogController!

        describe("#init") {
            let stubView = UIView()

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
                systemUnderTest = NatDialogController(views: [stubView])
            }

            it("sets a view as subview") {
                let containerView = systemUnderTest.view.subviews.first
                let stackView = containerView?.subviews.first

                expect(stackView?.subviews.first).to(equal(stubView))
            }

            it("sets presentationStyle as expected") {
                expect(systemUnderTest.modalPresentationStyle).to(equal(.overCurrentContext))
            }

            it("sets modalTransitionStyle as expected") {
                expect(systemUnderTest.modalTransitionStyle).to(equal(.crossDissolve))
            }
        }
    }
}
