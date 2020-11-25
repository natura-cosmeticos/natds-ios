import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ProgressIndicatorCircular()
        DesignSystem().configure(with: .avonLight)

        describe("#configure") {
            beforeEach {
                systemUnderTest.configure(state: .showAndStartAnimation)
            }

            it("adds progress indicator") {
                expect(systemUnderTest.layer.sublayers?.count).toNot(beNil())
            }
        }

        describe("#isProgressHidden") {
            beforeEach {
                systemUnderTest.configure(state: .hideAndStopAnimation)
            }

            it("removes progress indicator") {
                expect(systemUnderTest.subviews.count).to(equal(0))
            }
        }
    }
}
