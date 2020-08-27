import Quick
import Nimble

@testable import NatDS

final class NatBadgeSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatBadge!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()

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

            context("when count is bigger than 99") {
                beforeEach {
                    systemUnderTest.configure(count: 100)
                }

                it("sets 99+ to label") {
                    expect(label?.text).to(equal("99+"))
                }
            }
        }

    }
}
