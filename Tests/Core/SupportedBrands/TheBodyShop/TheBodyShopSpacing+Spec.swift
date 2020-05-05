import Quick
import Nimble

@testable import NatDS

final class TheBodyShopSpacingSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = TheBodyShopSpacing()

        describe("#micro") {
            it("returns a CGFloat equal expected") {
                expect(systemUnderTest.micro).to(equal(4))
            }
        }

        describe("#tiny") {
            it("returns a CGFloat equal expected") {
                expect(systemUnderTest.tiny).to(equal(8))
            }
        }

        describe("#small") {
            it("returns a CGFloat equal expected") {
                expect(systemUnderTest.small).to(equal(16))
            }
        }

        describe("#standart") {
            it("returns a CGFloat equal expected") {
                expect(systemUnderTest.standart).to(equal(24))
            }
        }

        describe("#semi") {
            it("returns a CGFloat equal expected") {
                expect(systemUnderTest.semi).to(equal(32))
            }
        }

        describe("#large") {
            it("returns a CGFloat equal expected") {
                expect(systemUnderTest.large).to(equal(48))
            }
        }

        describe("#xLarge") {
            it("returns a CGFloat equal expected") {
                expect(systemUnderTest.xLarge).to(equal(64))
            }
        }
    }
}
