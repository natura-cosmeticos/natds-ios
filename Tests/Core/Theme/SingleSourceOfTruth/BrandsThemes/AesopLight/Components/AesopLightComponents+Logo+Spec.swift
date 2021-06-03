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
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomA)

                    expect(systemUnderTest).to(equal("aesop-a-custom"))
                }
            }

            describe("#customB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomB)

                    expect(systemUnderTest).to(equal("aesop-a-custom"))
                }
            }

            describe("#neutralA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralA)

                    expect(systemUnderTest).to(equal("aesop-a-official"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralB)

                    expect(systemUnderTest).to(equal("aesop-a-official"))
                }
            }
        }
    }
}
