import Quick
import Nimble

@testable import NatDS

final class NatImageSpec: QuickSpec {
    override func spec() {

        var systemUnderTest: NatImage!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = NatImage()
        }

        describe("#init") {
            it("starts with default `standard` variant") {
                expect(systemUnderTest.variant).to(equal(NatImage.ImageType.standard))
            }
            it("doesn't have an image configured") {
                expect(systemUnderTest.imageView.image).to(beNil())
            }
        }

        describe("#configure(variant:)") {
            context("variant standard") {
                beforeEach {
                    systemUnderTest.configure(variant: .standard)
                }
                it("is standard variant") {
                    expect(systemUnderTest.variant).to(equal(NatImage.ImageType.standard))
                }
            }
            context("variant highlight") {
                beforeEach {
                    systemUnderTest.configure(variant: .highlight)
                }
                it("is highlight variant") {
                    expect(systemUnderTest.variant).to(equal(NatImage.ImageType.highlight))
                }
            }
        }

        describe("#configureRadius(_:)") {
            context("default radius") {
                beforeEach {
                    systemUnderTest.configureRadius()
                }
                it("has radius none") {
                    expect(systemUnderTest.layer.cornerRadius).to(equal(getTokenFromTheme(\.borderRadiusNone)))
                }
            }
            context("none radius") {
                beforeEach {
                    systemUnderTest.configureRadius(.none)
                }
                it("has radius none") {
                    expect(systemUnderTest.layer.cornerRadius).to(equal(getTokenFromTheme(\.borderRadiusNone)))
                }
            }
            context("medium radius") {
                beforeEach {
                    systemUnderTest.configureRadius(.medium)
                }
                it("has radius medium") {
                    expect(systemUnderTest.layer.cornerRadius).to(equal(NatBorderRadius.medium))
                }
            }
            context("circle radius") {
                beforeEach {
                    systemUnderTest.configureRadius(.circle(imageHeight: 200))
                }
                it("has radius circle") {
                    expect(systemUnderTest.layer.cornerRadius).to(equal(NatBorderRadius.circle(viewHeight: 200)))
                }
            }

            describe("#configureFade(_:)") {
                context("default fade") {
                    beforeEach {
                        systemUnderTest.configureFade()
                    }
                    it("has bottom fade") {
                        expect(systemUnderTest.imageView.hasGradient).to(beTrue())
                        expect(systemUnderTest.imageView.gradientDirection).to(equal(.bottom))
                    }
                }
                context("bottom fade") {
                    beforeEach {
                        systemUnderTest.configureFade(.bottom)
                    }
                    it("has bottom fade") {
                        expect(systemUnderTest.imageView.hasGradient).to(beTrue())
                        expect(systemUnderTest.imageView.gradientDirection).to(equal(.bottom))
                    }
                }
                context("top fade") {
                    beforeEach {
                        systemUnderTest.configureFade(.top)
                    }
                    it("has top fade") {
                        expect(systemUnderTest.imageView.hasGradient).to(beTrue())
                        expect(systemUnderTest.imageView.gradientDirection).to(equal(.top))
                    }
                }
                context("left fade") {
                    beforeEach {
                        systemUnderTest.configureFade(.left)
                    }
                    it("has left fade") {
                        expect(systemUnderTest.imageView.hasGradient).to(beTrue())
                        expect(systemUnderTest.imageView.gradientDirection).to(equal(.left))
                    }
                }
                context("right fade") {
                    beforeEach {
                        systemUnderTest.configureFade(.right)
                    }
                    it("has right fade") {
                        expect(systemUnderTest.imageView.hasGradient).to(beTrue())
                        expect(systemUnderTest.imageView.gradientDirection).to(equal(.right))
                    }
                }
            }

            describe("#configureFallback(:)") {
                beforeEach {
                    systemUnderTest.configure(fallback: UIImage())
                }
                it("fallbackImage is not nil") {
                    expect(systemUnderTest.fallbackImage).toNot(beNil())
                }
            }

            describe("#configureImage(:)") {
                context("with an UIImage") {
                    beforeEach {
                        systemUnderTest.configure(setImage: UIImage())
                    }
                    it("image is not nil") {
                        expect(systemUnderTest.imageView.image).toNot(beNil())
                    }
                }
                context("from an URL") {
                    beforeEach {
                        systemUnderTest.configure(setImageFromURL: URL(string: ""))
                    }
                    it("image is nil because the url is nil") {
                        expect(systemUnderTest.imageView.image).to(beNil())
                    }
                }
                context("from an URL with fallback") {
                    beforeEach {
                        systemUnderTest.configure(fallback: UIImage())
                        systemUnderTest.configure(setImageFromURL: URL(string: ""))
                    }
                    it("image is not nil") {
                        expect(systemUnderTest.imageView.image).toNot(beNil())
                    }
                }
            }
        }
    }
}
