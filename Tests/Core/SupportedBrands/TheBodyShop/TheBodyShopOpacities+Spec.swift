import Quick
import Nimble

@testable import NatDS

final class TheBodyShopOpacitiesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopOpacities()

        describe("#opacity01") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity01).to(equal(0.04))
            }
        }

        describe("#opacity02") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity03).to(equal(0.12))
            }
        }

        describe("#opacity04") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity04).to(equal(0.16))
            }
        }

        describe("#opacity05") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity05).to(equal(0.24))
            }
        }

        describe("#opacity06") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity06).to(equal(0.32))
            }
        }

        describe("#opacity07") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity07).to(equal(0.48))
            }
        }

        describe("#opacity08") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity08).to(equal(0.56))
            }
        }

        describe("#opacity09") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity09).to(equal(0.64))
            }
        }

        describe("#opacity10") {
            it("returns a expect value") {
                expect(systemUnderTest.opacity10).to(equal(0.8))
            }
        }
    }
}
