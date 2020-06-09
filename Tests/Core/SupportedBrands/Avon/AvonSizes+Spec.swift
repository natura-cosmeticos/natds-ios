import Quick
import Nimble

@testable import NatDS

final class AvonSizesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonSizes()

        describe("#none") {
            it("returns an expected value") {
                expect(systemUnderTest.none).to(equal(0))
            }
        }

        describe("#micro") {
            it("returns an expected value") {
                expect(systemUnderTest.micro).to(equal(4))
            }
        }

        describe("#tiny") {
            it("returns an expected value") {
                expect(systemUnderTest.tiny).to(equal(8))
            }
        }

        describe("#small") {
            it("returns an expected value") {
                expect(systemUnderTest.small).to(equal(16))
            }
        }

        describe("#standard") {
            it("returns an expected value") {
                expect(systemUnderTest.standard).to(equal(24))
            }
        }

        describe("#semi") {
            it("returns an expected value") {
                expect(systemUnderTest.semi).to(equal(32))
            }
        }

        describe("#semix") {
            it("returns an expected value") {
                expect(systemUnderTest.semix).to(equal(40))
            }
        }

        describe("#medium") {
            it("returns an expected value") {
                expect(systemUnderTest.medium).to(equal(48))
            }
        }

        describe("#mediumx") {
            it("returns an expected value") {
                expect(systemUnderTest.mediumx).to(equal(56))
            }
        }

        describe("#large") {
            it("returns an expected value") {
                expect(systemUnderTest.large).to(equal(64))
            }
        }

        describe("#largex") {
            it("returns an expected value") {
                expect(systemUnderTest.largex).to(equal(72))
            }
        }

        describe("#largexx") {
            it("returns an expected value") {
                expect(systemUnderTest.largexx).to(equal(80))
            }
        }

        describe("#largexxx") {
            it("returns an expected value") {
                expect(systemUnderTest.largexxx).to(equal(88))
            }
        }

        describe("#huge") {
            it("returns an expected value") {
                expect(systemUnderTest.huge).to(equal(96))
            }
        }

        describe("#hugex") {
            it("returns an expected value") {
                expect(systemUnderTest.hugex).to(equal(128))
            }
        }

        describe("#hugexx") {
            it("returns an expected value") {
                expect(systemUnderTest.hugexx).to(equal(144))
            }
        }

        describe("#hugexxx") {
            it("returns an expected value") {
                expect(systemUnderTest.hugexxx).to(equal(192))
            }
        }

        describe("#veryhuge") {
            it("returns an expected value") {
                expect(systemUnderTest.veryhuge).to(equal(256))
            }
        }
    }
}
