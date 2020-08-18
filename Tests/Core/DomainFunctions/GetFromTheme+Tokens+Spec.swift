import Quick
import Nimble

@testable import NatDS

final class GetFromThemeTokensSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = getTheme

        describe("#getTheme") {
            context("when the brand is .avon") {
                beforeEach {
                    DesignSystem().configure(with: .avon)
                }

                it("calls storage.save only once") {
                    let theme = systemUnderTest()

                    expect(theme).to(beAnInstanceOf(AvonTheme.self))
                }
            }

            context("when the brand is .natura") {
                beforeEach {
                    DesignSystem().configure(with: .natura)
                }

                it("calls storage.save only once") {
                    let theme = systemUnderTest()

                    expect(theme).to(beAnInstanceOf(NaturaTheme.self))
                }
            }

            context("when the brand is .theBodyShop") {
                beforeEach {
                    DesignSystem().configure(with: .theBodyShop)
                }

                it("calls storage.save only once") {
                    let theme = systemUnderTest()

                    expect(theme).to(beAnInstanceOf(TheBodyShopTheme.self))
                }
            }
        }
    }
}
