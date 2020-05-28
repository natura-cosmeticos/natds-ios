import Quick
import Nimble

@testable import NatDS

final class NaturaColorPaletteDarkSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NaturaColorPaletteDark()

        describe("#primary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primary
                let expectedHex = "#F4AB34"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimary
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primaryLight
                let expectedHex = "#FEFDE8"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimaryLight
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#primaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.primaryDark
                let expectedHex = "#EF8426"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onPrimaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onPrimaryDark
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondary
                let expectedHex = "#FF6B0B"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondary") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondary
                let expectedHex = "#000000"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondaryLight
                let expectedHex = "#FFF8E1"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryLight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondaryLight
                let expectedHex = "#000000"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#secondaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.secondaryDark
                let expectedHex = "#FF5808"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSecondaryDark") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSecondaryDark
                let expectedHex = "#000000"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#background") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.background
                let expectedHex = "#121212"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onBackground") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onBackground
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#surface") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.surface
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSurface") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSurface
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#highlight") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.highlight
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#highEmphasis") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.highEmphasis
                let expectedHex = "#FAFAFA"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#mediumEmphasis") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.mediumEmphasis
                let expectedHex = "#BBBBBB"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#lowEmphasis") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.lowEmphasis
                let expectedHex = "#777777"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#success") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.success
                let expectedHex = "#569A32"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onSuccess") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onSuccess
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#warning") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.warning
                let expectedHex = "#FCC433"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onWarning") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onWarning
                let expectedHex = "#333333"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#alert") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.alert
                let expectedHex = "#E74627"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onAlert") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onAlert
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#link") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.link
                let expectedHex = "#227BBD"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }

        describe("#onLink") {
            it("returns a string of expected hex color") {
                let colorHex = systemUnderTest.onLink
                let expectedHex = "#FFFFFF"

                expect(colorHex == expectedHex).to(beTrue())
            }
        }
    }
}
