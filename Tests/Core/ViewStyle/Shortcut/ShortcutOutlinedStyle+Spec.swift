import Quick
import Nimble

@testable import NatDS

final class ShortcutOutlinedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ShortcutOutlinedStyle.self
        var shortcut: NatShortcut!
        let stubStyle = NatShortcut.Style { _ in }
        var shortcutView: UIView!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            shortcut = NatShortcut(style: stubStyle)
            shortcutView = shortcut.subviews.first
        }

        describe("#applyPrimaryStyle") {
            beforeEach {
                systemUnderTest.applyPrimaryStyle(on: shortcut)
            }

            it("sets an expected circle color") {
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromTokens(\.colorSurface)))
            }

            it("sets an expected circle border color") {
                let opacity = getTokenFromTheme(\.opacityMediumLow)
                let color = getUIColorFromTokens(\.colorPrimary).withAlphaComponent(opacity).cgColor

                expect(shortcutView?.layer.borderColor).to(equal(color))
            }

            it("sets an expected circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorPrimary)))
            }
        }

        describe("#applyDefaultStyle") {
            beforeEach {
                systemUnderTest.applyDefaultStyle(on: shortcut)
            }

            it("sets an expected circle color") {
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromTokens(\.colorSurface)))
            }

            it("sets an expected circle border color") {
                let opacity = getTokenFromTheme(\.opacityMediumLow)
                let color = getUIColorFromTokens(\.colorHighEmphasis).withAlphaComponent(opacity).cgColor

                expect(shortcutView?.layer.borderColor).to(equal(color))
            }

            it("sets an expected circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorHighEmphasis)))
            }
        }
    }
}
