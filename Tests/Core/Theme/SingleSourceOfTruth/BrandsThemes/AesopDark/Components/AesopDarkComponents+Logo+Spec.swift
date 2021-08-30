import Quick
import Nimble

@testable import NatDS

final class AesopDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AesopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopDarkTheme()
            }

            describe("#customA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomAFile)

                    expect(systemUnderTest).to(equal("aesop-a-custom"))
                }
            }

            describe("#customB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomBFile)

                    expect(systemUnderTest).to(equal("aesop-a-custom"))
                }
            }

            describe("#neutralA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralAFile)

                    expect(systemUnderTest).to(equal("aesop-a-official-dark"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralBFile)

                    expect(systemUnderTest).to(equal("aesop-a-official-dark"))
                }
            }
        }
    }
}
