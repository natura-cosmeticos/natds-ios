import Quick
import Nimble

@testable import NatDS

final class NatBorderRadiusSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatBorderRadius.self

        context("AvonDark") {
            let tokens = AvonDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .avonDark)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.borderRadiusSmall))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.borderRadiusMedium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.borderRadiusLarge))
                }
            }
        } // context - when using AvonDark as theme

        context("AvonLight") {
            let tokens = AvonLightTokens()

            beforeEach {
                DesignSystem().configure(with: .avonLight)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.borderRadiusSmall))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.borderRadiusMedium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.borderRadiusLarge))
                }
            }
        } // context - when using AvonLight as theme

        context("NaturaDark") {
            let tokens = NaturaDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaDark)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.borderRadiusSmall))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.borderRadiusMedium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.borderRadiusLarge))
                }
            }
        } // context - when using NaturaDark as theme

        context("NaturaLight") {
            let tokens = NaturaLightTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaLight)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.borderRadiusSmall))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.borderRadiusMedium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.borderRadiusLarge))
                }
            }
        } // context - when using NaturaLight as theme

        context("TheBodyShopDark") {
            let tokens = TheBodyShopDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopDark)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.borderRadiusSmall))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.borderRadiusMedium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.borderRadiusLarge))
                }
            }
        } // context - when using TheBodyShopDark as theme

        context("TheBodyShopLight") {
            let tokens = TheBodyShopLightTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopLight)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.borderRadiusSmall))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.borderRadiusMedium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.borderRadiusLarge))
                }
            }
        } // context - when using TheBodyShopLight as theme
    }
}
