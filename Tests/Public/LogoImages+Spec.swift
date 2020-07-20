import Quick
import Nimble

@testable import NatDS

final class LogoImagesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = LogoImages.self

        context("when Brand is Avon") {
            beforeEach {
                DesignSystem().configure(with: .avon)
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

        } // context - when Brand is Avon

        context("when Brand is Natura") {
            beforeEach {
                DesignSystem().configure(with: .natura)
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

        } // context - when Brand is Natura

        context("when Brand is The Body Shop") {
            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
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

        } // context - when Brand is Natura
    }
}
