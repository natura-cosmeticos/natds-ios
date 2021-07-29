import Quick
import Nimble

@testable import NatDS

final class NaturaLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is NaturaLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
            }

            describe("#customA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomA)

                    expect(systemUnderTest).to(equal("natura-a-custom"))
                }
            }

            describe("#customB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandCustomB)

                    expect(systemUnderTest).to(equal("natura-b-custom"))
                }
            }

            describe("#neutralA") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralA)

                    expect(systemUnderTest).to(equal("natura-a-official"))
                }
            }

            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralB)

                    expect(systemUnderTest).to(equal("natura-b-official"))
                }
            }
        }
    }
}
