import Nimble
import Quick

@testable import NatDS

final class UINavigationControllerStyleSpec: QuickSpec {
    override func spec() {
        var sut: UINavigationController!
        var color: UINavigationController.Color!
        
        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            sut = UINavigationController()
            color = .default
        }
        
        describe("configure(style:)") {
            beforeEach {
                sut.configure(style: color)
            }
            
            it("sets tintColor") {
                expect(sut.navigationBar.tintColor).to(equal(color.title))
            }
            it("sets barTintColor") {
                expect(sut.navigationBar.barTintColor).to(equal(color.background))
            }
            
            it("apply elevation") {
                let elevation = NatElevation.Elevation.elevation02
                let attributes = getTheme().elevations[keyPath: elevation.rawValue]
                
                expect(sut.navigationBar.layer.shadowColor).to(equal(attributes.shadowColor))
                expect(sut.navigationBar.layer.shadowOffset).to(equal(attributes.shadowOffSet))
                expect(sut.navigationBar.layer.shadowRadius).to(equal(attributes.shadowRadius))
                expect(sut.navigationBar.layer.shadowOpacity).to(equal(attributes.shadowOpacity))
                expect(sut.navigationBar.layer.masksToBounds).to(beFalse())
            }
            
            it("sets shadowImage") {
                expect(sut.navigationBar.shadowImage).toNot(beNil())
            }
        }
    }
}
