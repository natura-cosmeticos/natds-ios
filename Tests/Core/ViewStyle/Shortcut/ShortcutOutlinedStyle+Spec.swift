import Quick
import Nimble

@testable import NatDS

final class ShortcutOutlinedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ShortcutOutlinedStyle.self
        var shortcut: NatShortcut!
        let stubStyle = NatShortcut.Style { _ in }
        var circleView: UIView!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()

            shortcut = NatShortcut(style: stubStyle)
            circleView = shortcut.subviews.first
        }

        describe("#applyPrimaryStyle") {
            beforeEach {
                systemUnderTest.applyPrimaryStyle(on: shortcut)
            }

            it("sets an expected circle color") {
                expect(circleView?.backgroundColor).to(equal(getUIColorFromTokens(\.colorSurface)))
            }

            it("sets an expected circle border color") {
                let opacity = getTokenFromTheme(\.opacity04)
                let color = getUIColorFromTokens(\.colorPrimary).withAlphaComponent(opacity).cgColor

                expect(circleView?.layer.borderColor).to(equal(color))
            }

            it("sets an expected circle border width") {
                expect(circleView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected icon color") {
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorPrimary)))
            }
        }

        describe("#applyDefaultStyle") {
            beforeEach {
                systemUnderTest.applyDefaultStyle(on: shortcut)
            }

            it("sets an expected circle color") {
                expect(circleView?.backgroundColor).to(equal(getUIColorFromTokens(\.colorSurface)))
            }

            it("sets an expected circle border color") {
                let opacity = getTokenFromTheme(\.opacity04)
                let color = getUIColorFromTokens(\.colorHighEmphasis).withAlphaComponent(opacity).cgColor

                expect(circleView?.layer.borderColor).to(equal(color))
            }

            it("sets an expected circle border width") {
                expect(circleView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected icon color") {
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorHighEmphasis)))
            }
        }
    }
}
