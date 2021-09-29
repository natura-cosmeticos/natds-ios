// swiftlint:disable line_length
import Quick
import Nimble

@testable import NatDS

final class NatBadgeColorSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatBadge.Color.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#alert") {
            it("returns expected color for box") {
                expect(systemUnderTest.alert.box).to(equal(getUIColorFromComponentAttributes(\.badgeColorAlertBackground)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.alert.content).to(equal(getUIColorFromComponentAttributes(\.badgeColorAlertLabel)))
            }
        }

        describe("#success") {
            it("returns expected color for box") {
                expect(systemUnderTest.success.box).to(equal(getUIColorFromComponentAttributes(\.badgeColorSuccessBackground)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.alert.content).to(equal(getUIColorFromComponentAttributes(\.badgeColorSuccessLabel)))
            }
        }

        describe("#primary") {
            it("returns expected color for box") {
                expect(systemUnderTest.primary.box).to(equal(getUIColorFromComponentAttributes(\.badgeColorPrimaryBackground)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.primary.content).to(equal(getUIColorFromComponentAttributes(\.badgeColorPrimaryLabel)))
            }
        }

        describe("#secondary") {
            it("returns expected color for box") {
                expect(systemUnderTest.secondary.box).to(equal(getUIColorFromComponentAttributes(\.badgeColorSecondaryBackground)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.secondary.content).to(equal(getUIColorFromComponentAttributes(\.badgeColorSecondaryLabel)))
            }
        }
    }
}
