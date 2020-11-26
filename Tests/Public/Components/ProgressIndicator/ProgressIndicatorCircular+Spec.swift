import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        DesignSystem().configure(with: .avonLight)
        let systemUnderTest = ProgressIndicatorCircular()

        describe("#configure") {
            beforeEach {
                systemUnderTest.configure(state: .showAndStartAnimation)
            }

            it("adds progress indicator") {
                expect(systemUnderTest.isHidden).to(beFalse())
            }
        }

        describe("#isProgressHidden") {
            beforeEach {
                systemUnderTest.configure(state: .hideAndStopAnimation)
            }

            it("removes progress indicator") {
                expect(systemUnderTest.isHidden).to(beTrue())
            }
        }
    }
}
