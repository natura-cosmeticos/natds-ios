import Nimble
import Quick

@testable import NatDS

final class UIBarButtonItemIconSpec: QuickSpec {
    override func spec() {
        var selector: StubSelector!
        var sut: UIBarButtonItem!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            selector = StubSelector()

            sut = UIBarButtonItem(icon: nil, action: #selector(selector.handler), target: selector)
        }

        describe("#init") {
            it("sets expected icon") {
                let customView = sut.customView as? IconView
                expect(customView?.defaultImageView.isHidden).toNot(beTrue())
            }
            it("sets expected selector") {
                let tap = sut.customView?.gestureRecognizers?.first
                tap?.sendGesturesEvents()

                expect(selector.handlerWasCalled).to(beTrue())
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
