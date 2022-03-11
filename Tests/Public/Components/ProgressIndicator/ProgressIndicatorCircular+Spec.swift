import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSpec: QuickSpec {
    override func spec() {
        DesignSystem().configure(with: .avonLight)
        var systemUnderTest = NatProgressIndicatorCircular()

        describe("#configure: action") {
            beforeEach {
                systemUnderTest.startAnimation()
            }

            it("adds progress indicator") {
                expect(systemUnderTest.isHidden).to(beFalse())
            }
        }

        describe("#configure: size") {
            beforeEach {
                systemUnderTest = NatProgressIndicatorCircular(size: .large)
            }

            it("adds progress indicator") {
                expect(systemUnderTest.isHidden).to(beFalse())
            }
        }

        describe("#configure: backgroundLayer true") {
            beforeEach {
                systemUnderTest.configure(useBackgroundLayer: true)
            }

            it("adds backgroundLayer") {
                let color = getUIColorFromTokens(\.colorSurface).cgColor

                expect(systemUnderTest.backgroundLayer.fillColor).to(equal(color))
            }
        }

        describe("#configure: backgroundLayer false") {
            beforeEach {
                systemUnderTest.configure(useBackgroundLayer: false)
            }

            it("removes backgroundLayer") {
                expect(systemUnderTest.backgroundLayer.fillColor).to(equal(UIColor.clear.cgColor))
            }
        }

        describe("#isProgressHidden") {
            beforeEach {
                systemUnderTest.stopAnimation()
            }

            it("removes progress indicator") {
                expect(systemUnderTest.isHidden).to(beTrue())
            }
        }
    }
}
