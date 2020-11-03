import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when Theme is AesopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopLightTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }

                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Aesop/Horizontal")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

        describe("#vertical") {
            it("returns an image") {
                expect(systemUnderTest.vertical).toNot(beNil())
            }

            it("returns a expected image") {
                let expectedImage = AssetsHelper.image(from: "Logo/Aesop/Vertical")

                expect(systemUnderTest.vertical).to(equal(expectedImage))
            }
        }
    }

    context("when Theme is AvonLight") {
        beforeEach {
            ConfigurationStorage.shared.currentTheme = AvonLightTheme()
        }

        describe("#horizontal") {
            it("returns an image") {
                expect(systemUnderTest.horizontal).toNot(beNil())
            }

            it("returns a expected image") {
                let expectedImage = AssetsHelper.image(from: "Logo/Avon/Horizontal")

                expect(systemUnderTest.horizontal).to(equal(expectedImage))
            }
        }

        describe("#vertical") {
            it("returns an image") {
                expect(systemUnderTest.vertical).toNot(beNil())
            }

            it("returns a expected image") {
                let expectedImage = AssetsHelper.image(from: "Logo/Avon/Vertical")

                expect(systemUnderTest.vertical).to(equal(expectedImage))
            }
        }

    } // context - when theme is AvonLight

    context("when theme is NaturaLight") {
        beforeEach {
            ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
        }

        describe("#horizontal") {
            it("returns an image") {
                expect(systemUnderTest.horizontal).toNot(beNil())
            }

            it("returns a expected image") {
                let expectedImage = AssetsHelper.image(from: "Logo/Natura/Horizontal")

                expect(systemUnderTest.horizontal).to(equal(expectedImage))
            }
        }

        describe("#vertical") {
            it("returns an image") {
                expect(systemUnderTest.vertical).toNot(beNil())
            }

            it("returns a expected image") {
                let expectedImage = AssetsHelper.image(from: "Logo/Natura/Vertical")

                expect(systemUnderTest.vertical).to(equal(expectedImage))
            }
        }

    } // context - when theme is NaturaLight

    context("when Brand is The Body Shop") {
        beforeEach {
            ConfigurationStorage.shared.currentTheme = TheBodyShopLightTheme()
        }

        describe("#horizontal") {
            it("returns an image") {
                expect(systemUnderTest.horizontal).toNot(beNil())
            }

            it("returns a expected image") {
                let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/Horizontal")

                expect(systemUnderTest.horizontal).to(equal(expectedImage))
            }
        }

        describe("#vertical") {
            it("returns an image") {
                expect(systemUnderTest.vertical).toNot(beNil())
            }

            it("returns a expected image") {
                let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/Vertical")

                expect(systemUnderTest.vertical).to(equal(expectedImage))
            }
        }

    } // context - when theme is TheBodyShopLight
}
}
