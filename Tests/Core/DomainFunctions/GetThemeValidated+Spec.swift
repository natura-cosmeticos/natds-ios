import Quick
import Nimble

@testable import NatDS

final class GetThemeValidatedSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = getThemeValidated(from: fatalError:)

        beforeEach {
            ConfigurationStorage.shared.currentTheme = nil
        }

        context("when there is no theme stored") {
            it("execute a fatal error") {
                let systemUnderTestWrapper = { () -> Void in
                    _ = systemUnderTest(ConfigurationStorage.shared, { fatalError("stub error") })
                }

                expect(systemUnderTestWrapper()).to(throwAssertion())
            }
        }

        context("when some theme is stored") {
            it("returns a expect value") {
                ConfigurationStorage.shared.currentTheme = StubTheme()
                let theme = systemUnderTest(ConfigurationStorage.shared, designSystemFatalError)

                expect(theme).toNot(beNil())
            }
        }
    }
}
