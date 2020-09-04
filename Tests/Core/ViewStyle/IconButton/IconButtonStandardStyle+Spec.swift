import Quick
import Nimble

@testable import NatDS

final class IconButtonStandardStyleSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = IconButtonStandardStyle.self
        let stubStyle = NatIconButton.Style(applyStyle: { _ in })
        var iconButton: NatIconButton!
        var iconView: IconView!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()

            iconButton = NatIconButton(style: stubStyle)
            iconView = iconButton.subviews.first as? IconView
        }

        describe("#applyDefaultStyle") {
            beforeEach {
                systemUnderTest.applyDefaultStyle(iconButton: iconButton)
            }

            it("sets the expected color to icon") {
                let expectedColor = getUIColorFromTokens(\.colorHighEmphasis)

                expect(iconView.tintColor).to(equal(expectedColor))
            }
        }

        describe("#applyPrimaryStyle") {
            beforeEach {
                systemUnderTest.applyPrimaryStyle(iconButton: iconButton)
            }

            it("sets the expected color to icon") {
                let expectedColor = getUIColorFromTokens(\.colorPrimary)

                expect(iconView.tintColor).to(equal(expectedColor))
            }
        }
    }
}
