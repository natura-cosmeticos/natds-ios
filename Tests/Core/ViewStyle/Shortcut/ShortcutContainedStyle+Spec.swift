import Quick
import Nimble

@testable import NatDS

final class ShortcutContainedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ShortcutContainedStyle.self
        var shortcut: NatShortcut!
        let stubStyle = NatShortcut.Style { _ in }
        var circleView: UIView!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)

            shortcut = NatShortcut(style: stubStyle)
            circleView = shortcut.subviews.first
        }

        describe("#applyPrimaryStyle") {
            beforeEach {
                systemUnderTest.applyPrimaryStyle(on: shortcut)
            }

            it("sets an expected circle color") {
                expect(circleView?.backgroundColor).to(equal(getTheme().colors.primary))
            }

            it("does not set circle border color") {
                let expectedColor = UIView().layer.borderColor

                expect(circleView?.layer.borderColor).to(equal(expectedColor))
            }

            it("does not set circle border width") {
                expect(circleView?.layer.borderWidth).to(equal(0))
            }

            it("sets an expected icon color") {
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getTheme().colors.onPrimary))
            }
        }

        describe("#applyDefaultStyle") {
            beforeEach {
                systemUnderTest.applyDefaultStyle(on: shortcut)
            }

            it("sets an expected circle color") {
                expect(circleView?.backgroundColor).to(equal(getTheme().colors.surface))
            }

            it("does not set circle border color") {
                let expectedColor = UIView().layer.borderColor

                expect(circleView?.layer.borderColor).to(equal(expectedColor))
            }

            it("does not set circle border width") {
                expect(circleView?.layer.borderWidth).to(equal(0))
            }

            it("sets an expected icon color") {
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getTheme().colors.highEmphasis))
            }
        }
    }
}
