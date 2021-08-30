import Quick
import Nimble

@testable import NatDS

final class AvonLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AvonLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonLightTheme()
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

                    expect(systemUnderTest).to(equal("avon-a-official"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralBFile)

                    expect(systemUnderTest).to(equal("avon-a-official"))
                }
            }
        }
    }
}
