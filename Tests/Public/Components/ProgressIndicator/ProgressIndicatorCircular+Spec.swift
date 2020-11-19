import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ProgressIndicatorCircular()

        describe("#isProgressHidden") {
            beforeEach {
                systemUnderTest.configure()
            }

            it("removes progress indicator") {
                let count = systemUnderTest.subviews.count
                systemUnderTest.isProgressHidden(isProgressIndicatorHidden: true)
                expect(systemUnderTest.subviews.count).to(equal(count-1))
            }
        }
    }
}
