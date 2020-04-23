import Quick
import Nimble

@testable import NatDS

final class DesignSystemSpec: QuickSpec {
    override func spec() {
        describe("DesignSystem") {
            let systemUnderTest = DesignSystem.shared

            describe("#configure") {
                context("when the brand is .avon") {
                    beforeEach {
                        systemUnderTest.configure(with: .avon)
                    }

                    it("sets current theme to Avon") {
                        let theme = systemUnderTest.currentTheme

                        expect(theme).to(beAnInstanceOf(AvonTheme.self))
                    }
                }

                context("when the brand is .natura") {
                    beforeEach {
                        systemUnderTest.configure(with: .natura)
                    }

                    it("sets current theme to Natura") {
                        let theme = systemUnderTest.currentTheme

                        expect(theme).to(beAnInstanceOf(NaturaTheme.self))
                    }
                }

                context("when the brand is .theBodyShop") {
                    beforeEach {
                        systemUnderTest.configure(with: .theBodyShop)
                    }

                    it("sets current theme to The Body Shop") {
                        let theme = systemUnderTest.currentTheme

                        expect(theme).to(beAnInstanceOf(TheBodyShopTheme.self))
                    }
                }
            }
        }
    }
}
