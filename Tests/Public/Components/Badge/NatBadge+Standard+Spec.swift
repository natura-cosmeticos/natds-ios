import Quick
import Nimble

@testable import NatDS

final class NatBadgeStandardSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatBadge!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = NatBadge(style: .standard, color: .alert)
        }

        describe("#init") {
            var label: UILabel?

            beforeEach {
                label = systemUnderTest.subviews.first as? UILabel
            }

            it("has label text nil") {
                guard let label = try? XCTUnwrap(label) else { return }
                expect(label.text).to(beNil())
            }

            it("has a label") {
                expect(systemUnderTest.subviews.first).to(beAKindOf(UILabel.self))
            }
        }

        describe("#configure(count:)") {
            var label: UILabel?

            beforeEach {
                label = systemUnderTest.subviews.first as? UILabel
                systemUnderTest.configure(count: 0)
            }

            context("when count is smaller or equal to zero") {
                beforeEach {
                    systemUnderTest.configure(count: 0)
                    systemUnderTest.configure(limit: .unlimited)
                }

                it("does not set count to label") {
                    guard let label = try? XCTUnwrap(label) else { return }
                    expect(label.text).to(beNil())
                }

                it("hides badge") {
                    expect(systemUnderTest?.isHidden).to(beTrue())
                }
            }

            context("when count is between 1 and 99") {
                beforeEach {
                    systemUnderTest.configure(count: 2)
                }

                it("sets count to label") {
                    expect(label?.text).to(equal("2"))
                }
            }

            context("when limit is max9") {
                beforeEach {
                    systemUnderTest.configure(count: 100)
                    systemUnderTest.configure(limit: .max9)
                }

                it("sets 9+ to label") {
                    expect(label?.text).to(equal("9+"))
                }
            }

            context("when limit is max99") {
                beforeEach {
                    systemUnderTest.configure(count: 100)
                    systemUnderTest.configure(limit: .max99)
                }

                it("sets 99+ to label") {
                    expect(label?.text).to(equal("99+"))
                }
            }

            context("when limit is unlimited") {
                beforeEach {
                    systemUnderTest.configure(count: 100)
                    systemUnderTest.configure(limit: .unlimited)
                }

                it("sets 100 to label") {
                    expect(label?.text).to(equal("100"))
                }
            }
        }
    }
}
