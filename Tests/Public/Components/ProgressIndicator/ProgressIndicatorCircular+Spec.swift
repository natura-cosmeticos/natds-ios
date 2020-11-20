import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ProgressIndicatorCircular()
        DesignSystem().configure(with: .naturaLight)

        describe("#configure") {
            beforeEach {
                systemUnderTest.configure()
            }

            it("adds progress indicator") {
                expect(systemUnderTest.layer.sublayers?.count).toNot(beNil())
            }
        }

        describe("#isProgressHidden") {
            beforeEach {
                systemUnderTest.configure()
            }

            it("removes progress indicator") {
                systemUnderTest.isProgressHidden(true)
                expect(systemUnderTest.subviews.count).to(equal(0))
            }
        }
    }
}
