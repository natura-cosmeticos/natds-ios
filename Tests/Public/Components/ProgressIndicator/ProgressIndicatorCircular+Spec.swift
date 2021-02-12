import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        DesignSystem().configure(with: .avonLight)
        let systemUnderTest = NatProgressIndicatorCircular()

        describe("#configure: action") {
            beforeEach {
                systemUnderTest.configure(with: .showAndStartAnimation)
            }

            it("adds progress indicator") {
                expect(systemUnderTest.isHidden).to(beFalse())
            }
        }

        describe("#configure: size") {
            beforeEach {
                systemUnderTest.configure(with: .showAndStartAnimation, size: .large)
            }

            it("adds progress indicator") {
                expect(systemUnderTest.isHidden).to(beFalse())
            }
        }

        describe("#configure: backgroundLayer") {
            beforeEach {
                systemUnderTest.configure(with: .showAndStartAnimation)
                systemUnderTest.configure(useBackgroundLayer: true)
            }

            it("adds backgroundLayer") {
                expect(systemUnderTest.circleLayer.fillColor).to(equal(UIColor.white.cgColor))
            }

            it("removes backgroundLayer") {
                systemUnderTest.configure(useBackgroundLayer: false)
                expect(systemUnderTest.circleLayer.fillColor).to(equal(UIColor.clear.cgColor))
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
