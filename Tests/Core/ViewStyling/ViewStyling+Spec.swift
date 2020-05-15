import Quick
import Nimble

@testable import NatDS

final class ViewStylingSpecSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ViewStyling.self

        describe("#applyElevation") {
            var view: UIView!
            let elevationAttributes: ElevationAttributes!  = ElevationAttributes(
                shadowColor: UIColor.red.cgColor,
                shadowOffSet: .init(width: 123, height: 321),
                shadowRadius: 333,
                shadowOpacity: 0.66
            )

            beforeEach {
                view = .init(frame: .init(x: 0, y: 0, width: 200, height: 200))
                systemUnderTest.applyElevation(onView: view, with: elevationAttributes)
            }

            it("returns a expect shadowColor") {
                expect(view.layer.shadowColor).to(equal(elevationAttributes.shadowColor))
            }

            it("returns a expect shadowOffSet") {
                expect(view.layer.shadowOffset).to(equal(elevationAttributes.shadowOffSet))
            }

            it("returns a expect shadowRadius") {
                expect(view.layer.shadowRadius).to(equal(elevationAttributes.shadowRadius))
            }

            it("returns a expect shadowOpacity") {
                expect(view.layer.shadowOpacity).to(equal(elevationAttributes.shadowOpacity))
            }
        }
    }
}
