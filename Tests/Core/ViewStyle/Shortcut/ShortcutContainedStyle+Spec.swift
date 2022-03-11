import Quick
import Nimble

@testable import NatDS

// swiftlint:disable line_length
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

        describe("#applyStyle: primary enabled") {
            beforeEach {
                shortcut.color = .primary
                shortcut.isEnabled = true
                systemUnderTest.apply(on: shortcut)
            }

            it("sets an expected background color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorEnablePrimaryBackground)))
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

        describe("#applyStyle: primary disabled") {
            beforeEach {
                shortcut.color = .primary
                shortcut.isEnabled = false
                systemUnderTest.apply(on: shortcut)
            }

            it("sets an expected background color") {
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor).to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorDisablePrimaryBackground)))
            }

            it("does not set circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(0))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorMediumEmphasis)))
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
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorEnableNeutralBackground)))
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

        describe("#applyStyle: neutral disabled") {
            beforeEach {
                shortcut.color = .neutral
                shortcut.isEnabled = false
                systemUnderTest.apply(on: shortcut)
            }

            it("sets an expected background color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralBackground)))
            }

            it("sets an expected label color") {
                expect(shortcutView?.backgroundColor)
                    .to(equal(getUIColorFromComponentAttributes(\.shortcutContainedColorDisableNeutralBackground)))
            }

            it("does not set circle border width") {
                expect(shortcutView?.layer.borderWidth).to(equal(0))
            }

            it("sets an expected icon color") {
                let circleView = shortcutView?.subviews.first
                let iconView = circleView?.subviews.first as? IconView

                expect(iconView?.tintColor).to(equal(getUIColorFromTokens(\.colorMediumEmphasis)))
            }
        }
    }
}
