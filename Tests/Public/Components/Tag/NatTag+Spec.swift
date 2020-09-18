import Quick
import Nimble

@testable import NatDS

final class NatTagSpec: QuickSpec {
    override func spec() {
        var sut: NatTag!

        var applyStyleInvocations: Int!
        var styleSpy: NatTag.Style!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            applyStyleInvocations = 0

            styleSpy = .init(
                applyStyle: { _ in applyStyleInvocations += 1 }
            )

            sut = .init(style: styleSpy)
        }

        describe("#init") {
            it("applies style only once") {
                expect(applyStyleInvocations).to(equal(1))
            }
        }

        describe("#configure(text:)") {

            context("when text is not empty") {
                it("sets text to label") {
                    sut.configure(text: "stub text")

                    let label = sut.subviews.first as? UILabel

                    expect(label?.text).to(equal("stub text"))
                    expect(label?.isHidden).to(beFalse())
                }
            }

            context("when text is empty") {
                it("sets isHidden to true") {
                    sut.configure(text: "")

                    let label = sut.subviews.first as? UILabel

                    expect(label?.text).to(equal(""))
                    expect(sut.isHidden).to(beTrue())
                }
            }

        }

        describe("#configure(textColor:)") {
            beforeEach {
                sut.configure(textColor: UIColor.red)
            }

            it("sets textColor to label") {
                let label = sut.subviews.first as? UILabel

                expect(label?.textColor).to(equal(UIColor.red))
            }
        }

    }
}
