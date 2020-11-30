import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        DesignSystem().configure(with: .avonLight)
        let systemUnderTest = NatProgressIndicatorCircular()

        describe("#configure") {
            beforeEach {
                systemUnderTest.configure(with: .showAndStartAnimation)
            }

            it("adds progress indicator") {
                expect(systemUnderTest.isHidden).to(beFalse())
            }
        }

        describe("#isProgressHidden") {
            beforeEach {
                systemUnderTest.configure(with: .hideAndStopAnimation)
            }

            it("removes progress indicator") {
                expect(systemUnderTest.isHidden).to(beTrue())
            }
        }
    }
}
