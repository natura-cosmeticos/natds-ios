import Quick
import Nimble

@testable import NatDS

final class DividerStylesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = Divider.Styles.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#full-bleed") {
            let sut = systemUnderTest.fullBleed
            it("spaceLeft") {
                expect(sut.spaceLeft).to(equal(getTokenFromTheme(\.spacingNone)))
            }

            it("spaceRight") {
                expect(sut.spaceRight).to(equal(getTokenFromTheme(\.spacingNone)))
            }
        }

        describe("#middle") {
            let sut = systemUnderTest.middle
            it("spaceLeft") {
                expect(sut.spaceLeft).to(equal(getTokenFromTheme(\.spacingStandard)))
            }

            it("spaceRight") {
                expect(sut.spaceRight).to(equal(getTokenFromTheme(\.spacingStandard)))
            }
        }

        describe("#Inset") {
            let sut = systemUnderTest.inset
            it("spaceLeft") {
                expect(sut.spaceLeft).to(equal(getTokenFromTheme(\.spacingStandard)))
            }

            it("spaceRight") {
                expect(sut.spaceRight).to(equal(getTokenFromTheme(\.spacingNone)))
            }
        }
    }
}
