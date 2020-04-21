import Quick
import Nimble

@testable import NatDS

final class DesignSystemSpec: QuickSpec {
    override func spec() {
        describe("DesignSystem") {
            let designSystem = DesignSystem.shared

            describe("method .configure") {
                context("Brand: .avon") {
                    beforeEach {
                        designSystem.configure(with: .avon)
                    }

                    it("sets current theme to Avon") {
                        let theme = designSystem.currentTheme
                        expect(theme).to(beAnInstanceOf(AvonTheme.self))
                    }
                }

                context("Brand: .theBodyShop") {
                    beforeEach {
                        designSystem.configure(with: .theBodyShop)
                    }

                    it("sets current theme to The Body Shop") {
                        let theme = designSystem.currentTheme
                        expect(theme).to(beAnInstanceOf(TheBodyShopTheme.self))
                    }
                }
            }
        }
    }
}
