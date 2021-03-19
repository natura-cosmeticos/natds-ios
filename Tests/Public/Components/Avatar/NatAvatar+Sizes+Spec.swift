import Quick
import Nimble

@testable import NatDS

final class NatAvatarSizesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatAvatar.Size.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#all sizes") {
            it("has 5 possible sizes") {
                expect(systemUnderTest.allCases.count).to(equal(5))
            }
        }

        describe("#standard") {
            it("returns an expected value") {
                expect(systemUnderTest.standard.value).to(equal(getTokenFromTheme(\.sizeStandard)))
            }
        }

        describe("#semi") {
            it("returns an expected value") {
                expect(systemUnderTest.semi.value).to(equal(getTokenFromTheme(\.sizeSemi)))
            }
        }

        describe("#semiX") {
            it("returns an expected value") {
                expect(systemUnderTest.semiX.value).to(equal(getTokenFromTheme(\.sizeSemiX)))
            }
        }

        describe("#medium") {
            it("returns an expected value") {
                expect(systemUnderTest.medium.value).to(equal(getTokenFromTheme(\.sizeMedium)))
            }
        }

        describe("#largeXXX") {
            it("returns an expected value") {
                expect(systemUnderTest.largeXXX.value).to(equal(getTokenFromTheme(\.sizeLargeXXX)))
            }
        }
    }
}
