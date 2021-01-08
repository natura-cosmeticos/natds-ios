import Quick
import Nimble

@testable import NatDS

final class ShortcutContainedStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = ShortcutContainedStyle.self
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
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromTokens(\.colorPrimary)))
            }

            it("does not set circle border color") {
                let expectedColor = UIView().layer.borderColor

                expect(shortcutView?.layer.borderColor).to(equal(expectedColor))
            }

            it("does not set circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(0))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorOnPrimary)))
            }
        }

        describe("#applyDefaultStyle") {
            beforeEach {
                systemUnderTest.applyDefaultStyle(on: shortcut)
            }

            it("sets an expected circle color") {
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromTokens(\.colorSurface)))
            }

            it("does not set circle border color") {
                let expectedColor = UIView().layer.borderColor

                expect(shortcutView?.layer.borderColor).to(equal(expectedColor))
            }

            it("does not set circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(0))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorHighEmphasis)))
            }
        }
    }
}
