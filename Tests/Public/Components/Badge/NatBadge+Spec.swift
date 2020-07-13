import Quick
import Nimble

@testable import NatDS

final class NatBadgeSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatBadge!

        beforeEach {
            DesignSystem().configure(with: .natura)

            systemUnderTest = NatBadge(style: .standard, color: .alert)
        }

        describe("#init") {
            var label: UILabel?

            beforeEach {
                label = systemUnderTest.subviews.first as? UILabel
            }

            it("has count nil") {
                expect(label?.text).to(beNil())
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

            it("sets count to label") {
                expect(label?.text).to(equal("0"))
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
