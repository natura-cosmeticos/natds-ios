import Quick
import Nimble

@testable import NatDS

final class GetOrCreatedCachedColorSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = getOrCreatedCachedColor(colorHex: storage: fatalError:)

        beforeEach {
            ConfigurationStorage.shared.currentTheme = nil
        }

        context("when there is no theme stored") {
            it("execute a fatal error") {
                let systemUnderTestWrapper = { () -> Void in
                    _ = systemUnderTest("fakeColor", ConfigurationStorage.shared, { fatalError("stub error") })
                }

                expect(systemUnderTestWrapper()).to(throwAssertion())
            }
        }

        context("when some theme is stored") {
            it("returns a expect value") {
                ConfigurationStorage.shared.currentTheme = StubThemeProtocol()
                let theme = systemUnderTest("#000000", ConfigurationStorage.shared, { fatalError("stub error") })

                expect(theme).toNot(beNil())
            }
        }
    }
}
