import Quick
import Nimble

@testable import NatDS

final class BadgeableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: Badgeable!

        beforeEach {
            DesignSystem().configure(with: .natura)

            systemUnderTest = BadgeableStub()
        }

        describe("#addBadge(style:color:)") {
            beforeEach {
                systemUnderTest.addBadge(style: .standard, color: .alert)
            }

            it("adds badge") {
                expect(systemUnderTest.subviews.first).to(beAKindOf(NatBadge.self))
            }
        }

        describe("#setBadge(count:)") {
            var badge: NatBadge?

            beforeEach {
                systemUnderTest.addBadge(style: .standard, color: .alert)
                systemUnderTest.setBadge(count: 35)
                badge = systemUnderTest.subviews.first as? NatBadge
            }

            it("sets badge count") {
                let label = badge?.subviews.first as? UILabel
                expect(label?.text).to(equal("35"))
            }
        }

        describe("#removeBadge()") {
            beforeEach {
                systemUnderTest.addBadge(style: .standard, color: .alert)
                systemUnderTest.removeBadge()
            }

            it("removes badge") {
                expect(systemUnderTest.subviews.first as? NatBadge).to(beNil())
            }
        }

        describe("#setBadgeIsHidden(hidden:)") {
            var badge: NatBadge?

            beforeEach {
                systemUnderTest.addBadge(style: .standard, color: .alert)
            }

            context("when hidden is true") {
                beforeEach {
                    systemUnderTest.setBadgeIsHidden(true)
                    badge = systemUnderTest.subviews.first as? NatBadge
                }

                it("sets isHidden to true") {
                    expect(badge?.isHidden).to(beTrue())
                }
            }

            context("when hidden is false") {
                beforeEach {
                    systemUnderTest.setBadgeIsHidden(false)
                    badge = systemUnderTest.subviews.first as? NatBadge
                }

                it("sets isHidden to false") {
                    expect(badge?.isHidden).to(beFalse())
                }
            }

        }

    }
}
