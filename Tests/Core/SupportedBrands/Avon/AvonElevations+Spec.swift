import Quick
import Nimble

@testable import NatDS

final class AvonElevationsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonElevations()

        describe("#elevation01") {
            let attributes = systemUnderTest.elevation01

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 1)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(1))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation02") {
            let attributes = systemUnderTest.elevation02

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 2)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(2))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation03") {
            let attributes = systemUnderTest.elevation03

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 3)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(4))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation04") {
            let attributes = systemUnderTest.elevation04

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 4)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(5))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation05") {
            let attributes = systemUnderTest.elevation05

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 6)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(10))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation06") {
            let attributes = systemUnderTest.elevation06

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 8)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(10))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation07") {
            let attributes = systemUnderTest.elevation07

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 9)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(12))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation08") {
            let attributes = systemUnderTest.elevation08

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 12)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(17))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation09") {
            let attributes = systemUnderTest.elevation09

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 16)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(24))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevation10") {
            let attributes = systemUnderTest.elevation10

            it("returns a expect shadowColor") {
                let cgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                expect(attributes.shadowColor).to(equal(cgColor))
            }

            it("returns a expect shadowOffSet") {
                expect(attributes.shadowOffSet).to(equal(.init(width: 0, height: 24)))
            }

            it("returns a expect shadowRadius") {
                expect(attributes.shadowRadius).to(equal(38))
            }

            it("returns a expect shadowOpacity") {
                expect(attributes.shadowOpacity).to(equal(0.14))
            }
        }
    }
}
