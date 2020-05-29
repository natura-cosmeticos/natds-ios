import Quick
import Nimble

@testable import NatDS

final class DynamicColorsSpec: QuickSpec {
    override func spec() {
        var dynamicColorFactorySpy: DynamicColorFactorySpy!
        var systemUnderTest: DynamicColors!

        beforeEach {
            dynamicColorFactorySpy = DynamicColorFactorySpy()
            systemUnderTest = DynamicColors(dynamicColorFactory: dynamicColorFactorySpy)
        }

        describe("colors from Primary") {
            describe(".primary") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.primary
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.primary))
                }
            }

            describe(".onPrimary") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onPrimary
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onPrimary))
                }

            }

            describe(".primaryLight") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.primaryLight
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.primaryLight))
                }

            }

            describe(".onPrimaryLight") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onPrimaryLight
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onPrimaryLight))
                }

            }

            describe(".primaryDark") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.primaryDark
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.primaryDark))
                }

            }

            describe(".onPrimaryDark") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onPrimaryDark
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onPrimaryDark))
                }

            }
        } //describe - colors from Primary group

        describe("colors from Secondary") {
            describe(".secondary") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.secondary
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.secondary))
                }

            }

            describe(".onSecondary") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onSecondary
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onSecondary))
                }

            }

            describe(".secondaryLight") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.secondaryLight
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.secondaryLight))
                }

            }

            describe(".onSecondaryLight") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onSecondaryLight
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onSecondaryLight))
                }

            }

            describe(".secondaryDark") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.secondaryDark
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.secondaryDark))
                }

            }

            describe(".onSecondaryDark") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onSecondaryDark
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onSecondaryDark))
                }

            }
        } // describe - colors from Secondary group

        describe("colors from Surface") {
            describe(".background") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.primary
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.primary))
                }

            }

            describe(".onBackground") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onBackground
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onBackground))
                }

            }

            describe(".surface") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.surface
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.surface))
                }

            }

            describe(".onSurface") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onSurface
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onSurface))
                }

            }
        } // describe - colors from Surface group

        describe("colors from Content") {
            describe(".highlight") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.highlight
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.highlight))
                }

            }

            describe(".highEmphasis") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.highEmphasis
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.highEmphasis))
                }

            }

            describe(".mediumEmphasis") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.mediumEmphasis
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.mediumEmphasis))
                }

            }

            describe(".lowEmphasis") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.lowEmphasis
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.lowEmphasis))
                }

            }
        } // describe - colors from Content group

        describe("colors from Feedback") {
            describe(".success") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.success
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.success))
                }

            }

            describe(".onSuccess") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onSuccess
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onSuccess))
                }

            }

            describe(".warning") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.warning
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.warning))
                }

            }

            describe(".onWarning") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onWarning
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onWarning))
                }

            }

            describe(".alert") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.alert
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.alert))
                }

            }

            describe(".onAlert") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onAlert
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onAlert))
                }

            }

            describe(".link") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.link
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.link))
                }

            }

            describe(".onLink") {
                it("uses expected keyPath") {
                    _ = systemUnderTest.onLink
                    expect(dynamicColorFactorySpy.keyPathInvoked).to(equal(\.onLink))
                }

            }
        } // describe - colors from Feedback
    }
}

fileprivate final class DynamicColorFactorySpy: DynamicColorFactory {
    var keyPathInvoked: KeyPath<ColorPalette, String>?

    func createDynamicColor(for keyPath: KeyPath<ColorPalette, String>) -> UIColor {
        keyPathInvoked = keyPath

        return .black
    }
}
