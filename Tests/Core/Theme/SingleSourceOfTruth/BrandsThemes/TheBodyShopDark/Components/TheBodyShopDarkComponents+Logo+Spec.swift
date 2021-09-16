import Quick
import Nimble

@testable import NatDS

final class TheBodyShopDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is TheBodyShopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopDarkTheme()
            }

            describe("#customA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomAFile)

                    expect(systemUnderTest).to(equal("thebodyshop-a-custom"))
                }
            }

            describe("#customB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomBFile)

                    expect(systemUnderTest).to(equal("thebodyshop-b-custom"))
                }
            }

            describe("#neutralA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralAFile)

                    expect(systemUnderTest).to(equal("thebodyshop-a-official-dark"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralBFile)

                    expect(systemUnderTest).to(equal("thebodyshop-b-official-dark"))
                }
            }
        }
    }
}
