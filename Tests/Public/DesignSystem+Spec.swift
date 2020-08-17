import Quick
import Nimble

@testable import NatDS

final class DesignSystemSpec: QuickSpec {
    override func spec() {
        var mockStorage: MockStorage!
        var systemUnderTest: DesignSystem!

        beforeEach {
            mockStorage = MockStorage()
            systemUnderTest = DesignSystem(storage: mockStorage)
        }

        describe("#init") {
            it("does not call storage.save") {
                expect(mockStorage.saveThemeInvocations).to(equal(0))
            }

            it("does not call storage.save") {
                expect(mockStorage.saveThemeProtocolInvocations).to(equal(0))
            }

            it("does not call storage.getTheme") {
                expect(mockStorage.getThemeInvocations).to(equal(0))
            }

            it("does not call storage.getThemeProtocol") {
                expect(mockStorage.getThemeProtocolInvocations).to(equal(0))
            }
        }

        describe("#configure(brand:)") {
            context("when the brand is .avon") {
                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .avon)
                    expect(mockStorage.saveThemeInvocations).to(equal(1))
                }
            }

            context("when the brand is .natura") {
                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .natura)

                    expect(mockStorage.saveThemeInvocations).to(equal(1))
                }
            }
            context("when the brand is .theBodyShop") {
                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .theBodyShop)

                    expect(mockStorage.saveThemeInvocations).to(equal(1))
                }
            }
        }

        describe("#configure(theme:)") {
            context("when the brand is .avonLight") {
                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .avonDark)

                    expect(mockStorage.saveThemeProtocolInvocations).to(equal(1))
                }

                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .avonLight)

                    expect(mockStorage.saveThemeProtocolInvocations).to(equal(1))
                }

                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .naturaDark)

                    expect(mockStorage.saveThemeProtocolInvocations).to(equal(1))
                }

                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .naturaLight)

                    expect(mockStorage.saveThemeProtocolInvocations).to(equal(1))
                }

                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .theBodyShopDark)

                    expect(mockStorage.saveThemeProtocolInvocations).to(equal(1))
                }

                it("calls storage.save only once") {
                    systemUnderTest.configure(with: .theBodyShopLight)

                    expect(mockStorage.saveThemeProtocolInvocations).to(equal(1))
                }
            }
        }

        describe("#currentBrand") {
            context("when the brand is not configured") {
                beforeEach {
                    mockStorage = MockStorage()
                    systemUnderTest = DesignSystem(storage: mockStorage)
                }

                it("returns nil") {
                    let brand = systemUnderTest.currentBrand

                    expect(brand).to(beNil())
                }
            }

            context("when the brand is .avon") {
                beforeEach {
                    mockStorage = MockStorage()
                    systemUnderTest = DesignSystem(storage: mockStorage)
                    systemUnderTest.configure(with: .avon)
                }

                it("returns current brand as Avon") {
                    let brand = systemUnderTest.currentBrand

                    expect(brand).to(equal(.avon))
                }
            }

            context("when the brand is .natura") {
                beforeEach {
                    mockStorage = MockStorage()
                    systemUnderTest = DesignSystem(storage: mockStorage)
                    systemUnderTest.configure(with: .natura)
                }

                it("returns current brand as Natura") {
                    let brand = systemUnderTest.currentBrand

                    expect(brand).to(equal(.natura))
                }
            }

            context("when the brand is .theBodyShop") {
                beforeEach {
                    mockStorage = MockStorage()
                    systemUnderTest = DesignSystem(storage: mockStorage)
                    systemUnderTest.configure(with: .theBodyShop)
                }

                it("returns current brand as The Body Shop") {
                    let brand = systemUnderTest.currentBrand

                    expect(brand).to(equal(.theBodyShop))
                }
            }
        }
    }
}
