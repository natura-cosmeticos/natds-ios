import Quick
import Nimble

@testable import NatDS

final class NatLogoSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatLogo!
        ConfigurationStorage.shared.currentTheme = StubTheme()

        describe("#init") {
            beforeEach {
                systemUnderTest = NatLogo()
            }

            it("has an expected size") {
                expect(systemUnderTest.size.value).to(equal(getTokenFromTheme(\.sizeVeryHuge)))
            }

            it("has an expected color") {
                expect(systemUnderTest.color).to(equal(.neutral))
            }

            it("has an expected model") {
                expect(systemUnderTest.model).to(equal(.modelA))
            }
        }

        describe("#init with custom size") {
            beforeEach {
                systemUnderTest = NatLogo(size: .medium)
            }

            it("has the configured size") {
                expect(systemUnderTest.size.value).to(equal(getTokenFromTheme(\.sizeMedium)))
            }
        }

        describe("#configure: color") {
            beforeEach {
                systemUnderTest = NatLogo()
                systemUnderTest.configure(color: .primary)
            }

            it("applies the configured color") {
                expect(systemUnderTest.color.value).to(equal(getUIColorFromTokens(\.colorPrimary)))
            }
        }

        describe("#configure: model") {
            beforeEach {
                systemUnderTest = NatLogo()
                systemUnderTest.configure(model: .modelB)
            }

            it("applies the configured model") {
                expect(systemUnderTest.model).to(equal(.modelB))
            }
        }
    }
}
