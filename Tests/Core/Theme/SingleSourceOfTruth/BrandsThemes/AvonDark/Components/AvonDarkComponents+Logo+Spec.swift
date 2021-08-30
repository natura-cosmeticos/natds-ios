import Quick
import Nimble

@testable import NatDS

final class AvonDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AvonDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonDarkTheme()
            }

            describe("#customA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomAFile)

                    expect(systemUnderTest).to(equal("avon-a-custom"))
                }
            }

            describe("#customB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomBFile)

                    expect(systemUnderTest).to(equal("avon-a-custom"))
                }
            }

            describe("#neutralA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralAFile)

                    expect(systemUnderTest).to(equal("avon-a-official-dark"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralBFile)

                    expect(systemUnderTest).to(equal("avon-a-official-dark"))
                }
            }
        }
    }
}
