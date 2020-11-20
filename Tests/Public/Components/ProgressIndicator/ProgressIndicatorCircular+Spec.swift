import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ProgressIndicatorCircular()
        DesignSystem().configure(with: .naturaLight)

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
