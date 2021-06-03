import Quick
import Nimble

@testable import NatDS

final class NaturaDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is NaturaDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaDarkTheme()
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

                    expect(systemUnderTest).to(equal("natura-a-official-dark"))
                }
            }
            
            describe("#neutralB") {
                it("returns a expected path") {
                    let systemUnderTest = getTokenFromTheme(\.assetBrandNeutralB)

                    expect(systemUnderTest).to(equal("natura-b-official-dark"))
                }
            }
        }
    }
}
