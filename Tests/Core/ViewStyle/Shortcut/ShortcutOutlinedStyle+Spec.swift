import Quick
import Nimble

@testable import NatDS

// swiftlint:disable line_length
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

        describe("#applyStyle: primary enabled") {
            beforeEach {
                shortcut.color = .primary
                shortcut.isEnabled = true
                systemUnderTest.apply(on: shortcut)
            }

            it("sets an expected background color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryBackground)))
            }

            it("sets an expected border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected border color") {
                let expectedColor = getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnablePrimaryBorder).cgColor

                expect(shortcutView?.layer.borderColor).to(equal(expectedColor))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorHighEmphasis)))
            }
        }

        describe("#applyStyle: primary disabled") {
            beforeEach {
                shortcut.color = .primary
                shortcut.isEnabled = false
                systemUnderTest.apply(on: shortcut)
            }

            it("sets an expected background color") {
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryBackground)))
            }

            it("does not set circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected border color") {
                let expectedColor = getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisablePrimaryBorder).cgColor

                expect(shortcutView?.layer.borderColor).to(equal(expectedColor))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis)))
            }
        }

        describe("#applyStyle: neutral enabled") {
            beforeEach {
                shortcut.color = .neutral
                shortcut.isEnabled = true
                systemUnderTest.apply(on: shortcut)
            }

            it("sets an expected background color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralBackground)))
            }

            it("does not set circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected border color") {
                let expectedColor = getUIColorFromComponentAttributes(\.shortcutOutlinedColorEnableNeutralBorder).cgColor

                expect(shortcutView?.layer.borderColor).to(equal(expectedColor))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorHighEmphasis)))
            }
        }

        describe("#applyStyle: neutral disabled") {
            beforeEach {
                shortcut.color = .neutral
                shortcut.isEnabled = false
                systemUnderTest.apply(on: shortcut)
            }

            it("sets an expected background color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralBackground)))
            }

            it("does not set circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(1))
            }

            it("sets an expected border color") {
                let expectedColor = getUIColorFromComponentAttributes(\.shortcutOutlinedColorDisableNeutralBorder).cgColor

                expect(shortcutView?.layer.borderColor).to(equal(expectedColor))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorLowEmphasis)))
            }
        }
    }
}
