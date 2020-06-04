import Quick
import Nimble

@testable import NatDS

final class NaturaElevationsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaElevations()

        describe("#none") {
            let attributes = systemUnderTest.none

            it("returns an expected shadowColor") {
                expect(attributes.shadowColor).to(beNil())
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: -3)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(3))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0))
            }
        }

        describe("#elevation01") {
            let attributes = systemUnderTest.elevation01

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 1)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(1))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation02") {
            let attributes = systemUnderTest.elevation02

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 2)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(2))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation03") {
            let attributes = systemUnderTest.elevation03

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 3)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(4))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation04") {
            let attributes = systemUnderTest.elevation04

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 4)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(5))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation05") {
            let attributes = systemUnderTest.elevation05

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 6)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(10))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation06") {
            let attributes = systemUnderTest.elevation06

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 8)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(10))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation07") {
            let attributes = systemUnderTest.elevation07

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 9)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(12))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation08") {
            let attributes = systemUnderTest.elevation08

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 12)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(17))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation09") {
            let attributes = systemUnderTest.elevation09

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 16)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(24))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation10") {
            let attributes = systemUnderTest.elevation10

            it("returns an expected shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns an expected shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 24)))
            }

            it("returns an expected shadowRadius") {
                expect(attributes.shadowRadius).to(equal(38))
            }

            it("returns an expected shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }
    }
}
