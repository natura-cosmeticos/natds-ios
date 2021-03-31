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
                expect(systemUnderTest.alert.box).to(equal(getUIColorFromTokens(\.colorAlert)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.alert.content).to(equal(getUIColorFromTokens(\.colorOnAlert)))
            }
        }

        describe("#success") {
            it("returns expected color for box") {
                expect(systemUnderTest.success.box).to(equal(getUIColorFromTokens(\.colorSuccess)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.alert.content).to(equal(getUIColorFromTokens(\.colorOnSuccess)))
            }
        }

        describe("#primary") {
            it("returns expected color for box") {
                expect(systemUnderTest.primary.box).to(equal(getUIColorFromTokens(\.colorPrimary)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.primary.content).to(equal(getUIColorFromTokens(\.colorOnPrimary)))
            }
        }

        describe("#secondary") {
            it("returns expected color for box") {
                expect(systemUnderTest.secondary.box).to(equal(getUIColorFromTokens(\.colorSecondary)))
            }

            it("returns expected color for content") {
                expect(systemUnderTest.secondary.content).to(equal(getUIColorFromTokens(\.colorOnSecondary)))
            }
        }
    }
}
