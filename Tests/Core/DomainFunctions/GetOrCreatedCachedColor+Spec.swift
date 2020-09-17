import Quick
import Nimble

@testable import NatDS

final class GetOrCreatedCachedColorSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = getOrCreatedCachedColor(colorHex: storage: fatalError:)
        let store = ConfigurationStorage.shared

        beforeEach {
            store.currentTheme = nil
            store.cachedColors = [:]
        }

        context("when there is no theme stored") {
            it("execute a fatal error") {
                let systemUnderTestWrapper = { () -> Void in
                    _ = systemUnderTest("fakeColor", store, { fatalError("stub error") })
                }

                expect(systemUnderTestWrapper()).to(throwAssertion())
            }
        }

        context("when some theme is stored and there isn't any color cached") {
            var color: UIColor?

            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()
                color = systemUnderTest("#000000", store, { fatalError("stub error") })
            }

            it("returns an expect color") {
                expect(color).toNot(beNil())
            }

            it("saves color on cache") {
                expect(store.cachedColors.count).to(equal(1))
            }
        }

        context("when some theme is stored and there is some color cached") {
            var color: UIColor?

            beforeEach {
                store.cachedColors["#FFFFFF"] = .white
                store.currentTheme = StubTheme()
                color = systemUnderTest("#000000", store, { fatalError("stub error") })
            }

            it("returns an expect color") {
                expect(color).toNot(beNil())
            }

            it("saves color on cache") {
                expect(store.cachedColors.count).to(equal(2))
            }
        }
    }
}
