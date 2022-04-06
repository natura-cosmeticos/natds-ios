import Quick
import Nimble

@testable import NatDS

final class UIViewCenterBoundsSpecs: QuickSpec {
    override func spec() {
        let systemUnderTest = UIView(frame: .init(x: 150, y: 150, width: 200, height: 200))

        describe("#centerBounds") {
            context("without a superview") {
                it("returns an expected value") {
                    let point = CGPoint(x: 100, y: 100)
                    expect(systemUnderTest.centerBounds).to(equal(point))
                }
            }

            context("with a superview") {
                beforeEach {
                    let superView = UIView(frame: .init(x: 0, y: 0, width: 500, height: 500))
                    superView.addSubview(systemUnderTest)
                }

                it("returns an expected value") {
                    let point = CGPoint(x: 100, y: 100)
                    expect(systemUnderTest.centerBounds).to(equal(point))
                }
            }
        }
    }
}
