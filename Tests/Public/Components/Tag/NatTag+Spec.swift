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

        describe("#configure(color:)") {
            it("sets primary") {
                sut.configure(color: .primary)
                expect(sut.color.tag).to(equal(getUIColorFromTokens(\.colorPrimary)))
                expect(sut.color.label).to(equal(getUIColorFromTokens(\.colorOnPrimary)))
            }

            it("sets secondary") {
                sut.configure(color: .secondary)
                expect(sut.color.tag).to(equal(getUIColorFromTokens(\.colorSecondary)))
                expect(sut.color.label).to(equal(getUIColorFromTokens(\.colorOnSecondary)))
            }

            it("sets success") {
                sut.configure(color: .success)
                expect(sut.color.tag).to(equal(getUIColorFromTokens(\.colorSuccess)))
                expect(sut.color.label).to(equal(getUIColorFromTokens(\.colorOnSuccess)))
            }

            it("sets alert") {
                sut.configure(color: .alert)
                expect(sut.color.tag).to(equal(getUIColorFromTokens(\.colorAlert)))
                expect(sut.color.label).to(equal(getUIColorFromTokens(\.colorOnAlert)))
            }

            it("sets warning") {
                sut.configure(color: .warning)
                expect(sut.color.tag).to(equal(getUIColorFromTokens(\.colorWarning)))
                expect(sut.color.label).to(equal(getUIColorFromTokens(\.colorOnWarning)))
            }

            it("sets link") {
                sut.configure(color: .link)
                expect(sut.color.tag).to(equal(getUIColorFromTokens(\.colorLink)))
                expect(sut.color.label).to(equal(getUIColorFromTokens(\.colorOnLink)))
            }

            it("sets custom") {
                sut.configure(color: .custom(backgroundColor: .black, labelColor: .white))
                expect(sut.color.tag).to(equal(.black))
                expect(sut.color.label).to(equal(.white))
            }
        }

        describe("#NatTag.Size") {
            it("sets small") {
                let sizes = NatTag.Size.self
                expect(sizes.small.value).to(equal(getTokenFromTheme(\.sizeSmall)))
            }

            it("sets standard") {
                let sizes = NatTag.Size.self
                expect(sizes.standard.value).to(equal(getTokenFromTheme(\.sizeStandard)))
            }
        }
    }
}
