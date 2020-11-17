import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ProgressIndicatorCircular()

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#configure") {
            beforeEach {
                systemUnderTest.configure()
            }

            it("adds progress indicator") {
                let count = 0
                expect(systemUnderTest.subviews.count).to(equal(count+1))
            }
        }

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
