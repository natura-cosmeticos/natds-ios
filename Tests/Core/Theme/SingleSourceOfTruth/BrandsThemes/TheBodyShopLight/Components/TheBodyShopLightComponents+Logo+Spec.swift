import Quick
import Nimble

@testable import NatDS

final class TheBodyShopLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is TheBodyShopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopLightTheme()
            }

            describe("#customA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomA)

                    expect(systemUnderTest).to(equal("thebodyshop-a-custom"))
                }
            }

            describe("#customB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomB)

                    expect(systemUnderTest).to(equal("thebodyshop-b-custom"))
                }
            }

            describe("#neutralA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralA)

                    expect(systemUnderTest).to(equal("thebodyshop-a-official"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralB)

                    expect(systemUnderTest).to(equal("thebodyshop-b-official"))
                }
            }
        }
    }
}
