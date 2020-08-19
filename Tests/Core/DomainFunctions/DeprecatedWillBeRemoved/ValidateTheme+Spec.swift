import Quick
import Nimble

@testable import NatDS

final class ValidateThemeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = validateTheme(from:fatalError:)

        context("when there is no theme stored") {
            describe("#validateTheme") {
                it("execute a fatal error") {
                    let systemUnderTestWrapper = { () -> Void in
                        _ = systemUnderTest(MockStorage(), { fatalError("stub error") })
                    }

                    expect(systemUnderTestWrapper()).to(throwAssertion())
                }
            }
        }

        context("when some theme is stored") {
            let mockStorage = MockStorage()
            mockStorage.save(theme: AvonTheme())

            describe("#validateTheme") {
                it("returns a expect value") {
                    let theme = systemUnderTest(mockStorage, designSystemFatalError)

                    expect(theme).toNot(beNil())
                }
            }
        }
    }
}
