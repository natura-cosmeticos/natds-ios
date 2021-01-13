import Quick
import Nimble

@testable import NatDS

final class BadgeableSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: Badgeable!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = BadgeableStub()
        }

        describe("#configure(badgeStyle:withColor:)") {
            beforeEach {
                systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
            }

            it("adds badge") {
                expect(systemUnderTest.subviews.first).to(beAKindOf(NatBadge.self))
            }

            it("does not add multiple badges") {
                systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
                expect(systemUnderTest.subviews.compactMap { $0 as? NatBadge }.count).to(equal(1))
            }
        }

        describe("#setBadge(count:)") {
            var badge: NatBadge?

            beforeEach {
                systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
                systemUnderTest.setBadge(count: 35)
                badge = systemUnderTest.subviews.first as? NatBadge
            }

            it("sets badge count") {
                let label = badge?.subviews.first as? UILabel
                expect(label?.text).to(equal("35"))
            }
        }

        describe("#setBadgeDot()") {

            beforeEach {
                systemUnderTest.configure(badgeStyle: .dot, withColor: .alert)
            }

            it("sets badge dot") {
                expect(systemUnderTest?.isHidden).to(beFalse())
            }
        }

        describe("#removeBadge()") {
            beforeEach {
                systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
                systemUnderTest.removeBadge()
            }

            it("removes badge") {
                expect(systemUnderTest.subviews.first as? NatBadge).to(beNil())
            }
        }

        describe("#setBadgeIsHidden(hidden:)") {
            var badge: NatBadge?

            beforeEach {
                systemUnderTest.configure(badgeStyle: .standard, withColor: .alert)
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
