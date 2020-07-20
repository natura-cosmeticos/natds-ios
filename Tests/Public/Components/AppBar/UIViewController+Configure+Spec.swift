import Nimble
import Quick

@testable import NatDS

final class UIViewControllerConfigureSpec: QuickSpec {
    override func spec() {
        var sut: UIViewController!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)
            sut = UIViewController()
        }

        describe("#configure(highlight:)") {
            context("when hightlight is .title") {
                beforeEach {
                    sut.configure(highlight: .title("Title"))
                }
                it("sets navigationItem title") {
                    expect(sut.title).to(equal("Title"))
                }
            }

            context("when hightlight is .image") {
                beforeEach {
                    sut.configure(highlight: .image)
                }
                it("sets navigationItem titleView") {
                    expect(sut.navigationItem.titleView).toNot(beNil())
                }
            }
        }

        describe("#configure(button:)") {
            var buttons: [UIBarButtonItem]!

            beforeEach {
                buttons = [UIBarButtonItem()]
                sut.configure(buttons: buttons)
            }

            it("sets navigationItem right barButtonItems") {
                expect(sut.navigationItem.rightBarButtonItems).to(equal(buttons))
            }
        }
    }
}
