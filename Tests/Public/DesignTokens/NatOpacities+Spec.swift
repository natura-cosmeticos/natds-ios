import Quick
import Nimble

@testable import NatDS

final class NatOpacitiesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatOpacities.self

        context("AvonDark") {
            let tokens = AvonDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .avonDark)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(tokens.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity02).to(equal(tokens.opacity02))
                }
            }

            describe("#opacity03") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(tokens.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(tokens.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(tokens.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(tokens.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(tokens.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(tokens.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(tokens.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(tokens.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(tokens.opacityFull))
                }
            }
        } // context - when using AvonDark as theme

        context("AvonLight") {
            let tokens = AvonLightTokens()

            beforeEach {
                DesignSystem().configure(with: .avonLight)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(tokens.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity02).to(equal(tokens.opacity02))
                }
            }

            describe("#opacity03") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(tokens.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(tokens.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(tokens.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(tokens.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(tokens.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(tokens.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(tokens.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(tokens.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(tokens.opacityFull))
                }
            }
        } // context - when using AvonLight as theme

        context("NaturaDark") {
            let tokens = NaturaDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaDark)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(tokens.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity02).to(equal(tokens.opacity02))
                }
            }

            describe("#opacity03") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(tokens.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(tokens.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(tokens.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(tokens.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(tokens.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(tokens.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(tokens.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(tokens.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(tokens.opacityFull))
                }
            }
        } // context - when using NaturaDark as theme

        context("NaturaLight") {
            let tokens = NaturaLightTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaLight)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(tokens.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity02).to(equal(tokens.opacity02))
                }
            }

            describe("#opacity03") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(tokens.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(tokens.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(tokens.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(tokens.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(tokens.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(tokens.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(tokens.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(tokens.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(tokens.opacityFull))
                }
            }
        } // context - when using NaturaLight as theme

        context("TheBodyShopDark") {
            let tokens = TheBodyShopDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopDark)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(tokens.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity02).to(equal(tokens.opacity02))
                }
            }

            describe("#opacity03") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(tokens.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(tokens.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(tokens.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(tokens.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(tokens.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(tokens.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(tokens.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(tokens.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(tokens.opacityFull))
                }
            }
        } // context - when using TheBodyShopDark as theme

        context("TheBodyShopLight") {
            let tokens = TheBodyShopLightTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopLight)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(tokens.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity02).to(equal(tokens.opacity02))
                }
            }

            describe("#opacity03") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(tokens.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(tokens.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(tokens.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(tokens.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(tokens.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(tokens.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(tokens.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(tokens.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(tokens.opacityFull))
                }
            }
        } // context - when using TheBodyShopLight as theme
    }
}
