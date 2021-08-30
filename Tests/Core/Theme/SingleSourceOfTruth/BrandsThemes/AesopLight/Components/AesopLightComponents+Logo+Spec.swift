import Quick
import Nimble

@testable import NatDS

final class AesopLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AesopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopLightTheme()
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

                    expect(systemUnderTest).to(equal("aesop-a-official"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralBFile)

                    expect(systemUnderTest).to(equal("aesop-a-official"))
                }
            }
        }
    }
}
