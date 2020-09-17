import Quick
import Nimble

@testable import NatDS

final class DesignSystemSpec: QuickSpec {
    override func spec() {
        var storage: ConfigurationStorage!
        var notificationSpy: NotificationCenterSpy!
        var systemUnderTest: DesignSystem!

        beforeEach {
            storage = ConfigurationStorage.shared
            storage.currentTheme = nil
            storage.cachedColors = [:]
            notificationSpy = NotificationCenterSpy()

            systemUnderTest = DesignSystem(storage: storage, notificationCenter: notificationSpy)
        }

        describe("#init") {
            it("does not call storage.save") {
                expect(storage.currentTheme).to(beNil())
            }

            it("does not have chaced colors") {
                expect(storage.cachedColors.count).to(equal(0))
            }

            it("does not call notificationCenter.post") {
                expect(notificationSpy.postInvocations).to(equal(0))
            }
        }

        describe("#configure(theme:)") {
            beforeEach {
                storage.cachedColors = ["#FFFFFF": .white]
            }

            context("when the theme is .aesopDark") {
                beforeEach {
                    systemUnderTest.configure(with: .aesopDark)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(AesopDarkTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
                }
            }

            context("when the theme is .aesopLight") {
                beforeEach {
                    systemUnderTest.configure(with: .aesopLight)
                }

                it("sets an expected theme") {
                    expect(storage.currentTheme).to(beAnInstanceOf(AesopLightTheme.self))
                }

                it("cleans cached color") {
                    expect(storage.cachedColors.count).to(equal(0))
                }

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
                }
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

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
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

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
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

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
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

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
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

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
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

                it("calls notificationCenter.post only once") {
                    expect(notificationSpy.postInvocations).to(equal(1))
                }

                it("calls notificationCenter.post with expected parameters") {
                    expect(notificationSpy.lastPostSent?.name).to(equal(.themeHasChanged))
                    expect(notificationSpy.lastPostSent?.object).to(beNil())
                }
            }
        }

        describe("#currentTheme") {
            context("when the theme is not mapped in AvailableTheme") {
                beforeEach {
                    storage.currentTheme = StubTheme()
                }

                it("returns nil") {
                    expect(systemUnderTest.currentTheme).to(beNil())
                }

                it("does not call notificationCenter.post") {
                    expect(notificationSpy.postInvocations).to(equal(0))
                }
            }

            context("when the theme is .avonDark") {
                beforeEach {
                    storage.currentTheme = AvonDarkTheme()
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.avonDark))
                }

                it("does not call notificationCenter.post") {
                    expect(notificationSpy.postInvocations).to(equal(0))
                }
            }

            context("when the theme is .avonLight") {
                beforeEach {
                    storage.currentTheme = AvonLightTheme()
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.avonLight))
                }

                it("does not call notificationCenter.post") {
                    expect(notificationSpy.postInvocations).to(equal(0))
                }
            }

            context("when the theme is .naturaDark") {
                beforeEach {
                    storage.currentTheme = NaturaDarkTheme()
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.naturaDark))
                }

                it("does not call notificationCenter.post") {
                    expect(notificationSpy.postInvocations).to(equal(0))
                }
            }

            context("when the theme is .naturaDark") {
                beforeEach {
                    storage.currentTheme = NaturaLightTheme()
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.naturaLight))
                }

                it("does not call notificationCenter.post") {
                    expect(notificationSpy.postInvocations).to(equal(0))
                }
            }

            context("when the theme is .theBodyShopDark") {
                beforeEach {
                    storage.currentTheme = TheBodyShopDarkTheme()
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.theBodyShopDark))
                }

                it("does not call notificationCenter.post") {
                    expect(notificationSpy.postInvocations).to(equal(0))
                }
            }

            context("when the theme is .theBodyShopLight") {
                beforeEach {
                    storage.currentTheme = TheBodyShopLightTheme()
                }

                it("returns an expected theme") {
                    expect(systemUnderTest.currentTheme).to(equal(.theBodyShopLight))
                }

                it("does not call notificationCenter.post") {
                    expect(notificationSpy.postInvocations).to(equal(0))
                }
            }
        }
    }
}
