import Quick
import Nimble

@testable import NatDS

final class NotificationNameThemeHasChangedSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = Notification.Name.themeHasChanged

        describe("#rawValue") {
            it("initializes tokens with AvonDarkTokens") {
                expect(systemUnderTest.rawValue).to(equal("ThemeHasChanged"))
            }
        }
    }
}
