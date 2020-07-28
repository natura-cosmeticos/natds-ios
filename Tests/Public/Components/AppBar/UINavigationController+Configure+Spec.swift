import Nimble
import Quick

@testable import NatDS

final class UINavigationControllerConfigureSpec: QuickSpec {
    override func spec() {
        var sut: UINavigationController!
        var style: UINavigationController.Style!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            sut = UINavigationController()
            style = .default
        }

        describe("configure(style:)") {
            beforeEach {
                sut.configure(style: style)
            }
            it("sets tintColor") {
                expect(sut.navigationBar.tintColor).to(equal(style.titleColor))
            }
            it("sets barTintColor") {
                expect(sut.navigationBar.barTintColor).to(equal(style.backgroundColor))
            }
            it("applies elevation") {
                let attributes = getTheme().elevations[keyPath: style.elevation.rawValue]

                expect(sut.navigationBar.layer.shadowColor).to(equal(attributes.shadowColor))
                expect(sut.navigationBar.layer.shadowOffset).to(equal(attributes.shadowOffSet))
                expect(sut.navigationBar.layer.shadowRadius).to(equal(attributes.shadowRadius))
                expect(sut.navigationBar.layer.shadowOpacity).to(equal(attributes.shadowOpacity))
                expect(sut.navigationBar.layer.masksToBounds).to(beFalse())
            }
            it("sets shadowImage") {
                expect(sut.navigationBar.shadowImage).toNot(beNil())
            }
            it("sets titleTextAttributes") {
                let foregroundAttribute = sut.navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor]
                if let foregroundColor = foregroundAttribute as? UIColor {
                    expect(foregroundColor).to(equal(NatColors.highEmphasis))
                } else {
                    fail()
                }
            }
        }
    }
}
