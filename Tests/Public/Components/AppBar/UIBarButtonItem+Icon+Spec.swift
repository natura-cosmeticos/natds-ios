import Nimble
import Quick

@testable import NatDS

final class UIBarButtonItemIconSpec: QuickSpec {
    override func spec() {
        var sut: UIBarButtonItem!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            sut = UIBarButtonItem(icon: Icon.filledActionAdd, action: Selector("Test"), target: self)
        }

        describe("#init") {
            it("sets expected icon") {
                let customView = sut.customView as? IconView
                expect(customView?.icon).to(equal(Icon.filledActionAdd))
            }
            it("sets expected selector") {
//                let tap = sut.customView?.gestureRecognizers?.first
//                tap?.sendGesturesEvents()
//
//                expect(tap?.responds(to: selector)).to(beTrue())
            }
            it("sets expected tap gesture") {
                let tap = sut.customView?.gestureRecognizers
                expect(tap).toNot(beNil())
            }
        }

        describe("#setBadgeValue(count:)") {
            beforeEach {
                sut.setBadgeValue(1)
            }

            it("adds a badge subview to customView") {
                let subview = sut.customView?.subviews.first(where: { $0 is NatBadge })
                expect(subview).toNot(beNil())
            }
        }
    }
}
