import Quick
import Nimble

@testable import NatDS

// swiftlint:disable function_body_length

final class AvonSizeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonSize()

        describe("#micro") {
            it("returns a expect value") {
                expect(systemUnderTest.micro).to(equal(4))
            }
        }

        describe("#tiny") {
            it("returns a expect value") {
                expect(systemUnderTest.tiny).to(equal(8))
            }
        }

        describe("#small") {
            it("returns a expect value") {
                expect(systemUnderTest.small).to(equal(16))
            }
        }

        describe("#standart") {
            it("returns a expect value") {
                expect(systemUnderTest.standart).to(equal(24))
            }
        }

        describe("#semi") {
            it("returns a expect value") {
                expect(systemUnderTest.semi).to(equal(32))
            }
        }

        describe("#semiX") {
            it("returns a expect value") {
                expect(systemUnderTest.semiX).to(equal(40))
            }
        }

        describe("#medium") {
            it("returns a expect value") {
                expect(systemUnderTest.medium).to(equal(48))
            }
        }

        describe("#mediumX") {
            it("returns a expect value") {
                expect(systemUnderTest.mediumX).to(equal(56))
            }
        }

        describe("#large") {
            it("returns a expect value") {
                expect(systemUnderTest.large).to(equal(64))
            }
        }

        describe("#largeX") {
            it("returns a expect value") {
                expect(systemUnderTest.largeX).to(equal(72))
            }
        }

        describe("#largeXX") {
            it("returns a expect value") {
                expect(systemUnderTest.largeXX).to(equal(80))
            }
        }

        describe("#largeXXX") {
            it("returns a expect value") {
                expect(systemUnderTest.largeXXX).to(equal(88))
            }
        }

        describe("#huge") {
            it("returns a expect value") {
                expect(systemUnderTest.huge).to(equal(96))
            }
        }

        describe("#hugeX") {
            it("returns a expect value") {
                expect(systemUnderTest.hugeX).to(equal(128))
            }
        }

        describe("#hugeXX") {
            it("returns a expect value") {
                expect(systemUnderTest.hugeXX).to(equal(144))
            }
        }

        describe("#hugeXXX") {
            it("returns a expect value") {
                expect(systemUnderTest.hugeXXX).to(equal(192))
            }
        }

        describe("#veryHuge") {
            it("returns a expect value") {
                expect(systemUnderTest.veryHuge).to(equal(256))
            }
        }
    }
}
