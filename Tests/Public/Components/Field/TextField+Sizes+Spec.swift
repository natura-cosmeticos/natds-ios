import Quick
import Nimble

@testable import NatDS

final class TextFieldSizesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TextField.Size.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }
        
        describe("#all sizes") {
            it("has 2 possible sizes") {
                expect(systemUnderTest.allCases.count).to(equal(2))
            }
        }

        describe("#medium") {
            it("returns an expected value") {
                expect(systemUnderTest.medium.value).to(equal(getTokenFromTheme(\.sizeMedium)))
            }
        }

        describe("#mediumX") {
            it("returns an expected value") {
                expect(systemUnderTest.mediumX.value).to(equal(getTokenFromTheme(\.sizeMediumX)))
            }
        }
    }
}
