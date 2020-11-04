import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        // context - when theme is AesopLight
        context("when Theme is AesopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopLightTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Aesop/HorizontalLight")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Aesop/VerticalLight")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }

        // context - when theme is AesopDark
        context("when Theme is AesopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopDarkTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Aesop/HorizontalDark")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Aesop/VerticalDark")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }

        // context - when theme is AvonLight
        context("when Theme is AvonLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonLightTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/HorizontalLight")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/VerticalLight")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }

        }

        // context - when theme is AvonDark
        context("when Theme is AvonDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonDarkTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/HorizontalDark")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/VerticalDark")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }

        }

        // context - when theme is NaturaLight
        context("when theme is NaturaLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Natura/HorizontalLight")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Natura/VerticalLight")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }

        }

        // context - when theme is NaturaDark
        context("when theme is NaturaDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaDarkTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Natura/HorizontalDark")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Natura/VerticalDark")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }

        }

        // context - when theme is TheBodyShopLight
        context("when Brand is The Body ShopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopLightTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/HorizontalLight")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/VerticalLight")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }

        }

        // context - when theme is TheBodyShopDark
        context("when Brand is The Body ShopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopDarkTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/HorizontalDark")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/VerticalDark")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }

        }
    }
}
