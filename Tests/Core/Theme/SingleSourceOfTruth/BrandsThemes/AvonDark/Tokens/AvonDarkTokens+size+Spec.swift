import Quick
import Nimble

@testable import NatDS

final class AvonDarkTokensSizeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonDarkTheme().tokens

        describe("#sizeNone") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeNone).to(equal(0))
            }
        }

        describe("#sizeMicro") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeMicro).to(equal(4))
            }
        }
        describe("#sizeTiny") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeTiny).to(equal(8))
            }
        }

        describe("#sizeSmall") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeSmall).to(equal(16))
            }
        }

        describe("#sizeStandard") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeStandard).to(equal(24))
            }
        }

        describe("#sizeSemi") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeSemi).to(equal(32))
            }
        }

        describe("#sizeSemiX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeSemiX).to(equal(40))
            }
        }

        describe("#sizeMedium") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeMedium).to(equal(48))
            }
        }

        describe("#sizeMediumX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeMediumX).to(equal(56))
            }
        }

        describe("#sizeLarge") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeLarge).to(equal(64))
            }
        }

        describe("#sizeLargeX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeLargeX).to(equal(72))
            }
        }

        describe("#sizeLargeXX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeLargeXX).to(equal(80))
            }
        }

        describe("#sizeLargeXXX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeLargeXXX).to(equal(88))
            }
        }

        describe("#sizeHuge") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeHuge).to(equal(96))
            }
        }

        describe("#sizeHugeX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeHugeX).to(equal(128))
            }
        }

        describe("#sizeHugeXX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeHugeXX).to(equal(144))
            }
        }

        describe("#sizeHugeXXX") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeHugeXXX).to(equal(192))
            }
        }

        describe("#sizeVeryHuge") {
            it("returns an expected value") {
                expect(systemUnderTest.sizeVeryHuge).to(equal(256))
            }
        }
    }
}
