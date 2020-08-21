import Quick
import Nimble

@testable import NatDS

final class DesignSystemSpec: QuickSpec {
    override func spec() {
        var storage: ConfigurationStorage!
        var systemUnderTest: DesignSystem!

        beforeEach {
            storage = ConfigurationStorage.shared
            storage.currentTheme = nil
            storage.cachedColors = [:]

            systemUnderTest = DesignSystem(storage: storage)
        }

        describe("#init") {
            it("does not call storage.save") {
                expect(storage.currentTheme).to(beNil())
            }

            it("does not call storage.save") {
                expect(storage.cachedColors.count).to(equal(0))
            }
        }

        describe("#configure(theme:)") {
            beforeEach {
                storage.cachedColors = ["#FFFFFF": .white]
            }

            context("when the theme is .avonDark") {
                beforeEach {
                    systemUnderTest.configure(with: .avonDark)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(AvonDarkTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }
            }

            context("when the theme is .avonLight") {
                beforeEach {
                    systemUnderTest.configure(with: .avonLight)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(AvonLightTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }
            }

            context("when the theme is .naturaDark") {
                beforeEach {
                    systemUnderTest.configure(with: .naturaDark)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(NaturaDarkTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }
            }

            context("when the theme is .naturaLight") {
                beforeEach {
                    systemUnderTest.configure(with: .naturaLight)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(NaturaLightTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }
            }

            context("when the theme is .theBodyShopDark") {
                beforeEach {
                    systemUnderTest.configure(with: .theBodyShopDark)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(TheBodyShopDarkTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }
            }

            context("when the theme is .theBodyShopLight") {
                beforeEach {
                    systemUnderTest.configure(with: .theBodyShopLight)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(TheBodyShopLightTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }
            }
        }

        describe("#currentTheme") {
            context("when the theme is .avonDark") {
                beforeEach {
                    systemUnderTest.configure(with: .avonDark)
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.avonDark))
                }
            }

            context("when the theme is .avonLight") {
                beforeEach {
                    systemUnderTest.configure(with: .avonLight)
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.avonLight))
                }
            }

            context("when the theme is .naturaDark") {
                beforeEach {
                    systemUnderTest.configure(with: .naturaDark)
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.naturaDark))
                }
            }

            context("when the theme is .naturaDark") {
                beforeEach {
                    systemUnderTest.configure(with: .naturaLight)
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.naturaLight))
                }
            }

            context("when the theme is .theBodyShopDark") {
                beforeEach {
                    systemUnderTest.configure(with: .theBodyShopDark)
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.theBodyShopDark))
                }
            }

            context("when the theme is .theBodyShopLight") {
                beforeEach {
                    systemUnderTest.configure(with: .theBodyShopLight)
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.theBodyShopLight))
                }
            }
        }
    }
}
