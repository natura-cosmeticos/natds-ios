import FBSnapshotTestCase

@testable import NatDS

class IconTests: FBSnapshotTestCase {
    func test_difference_between_icons_and_test_mirror() {
        let difference = diffBetweenIcons(
            appIcons: Icon.allCases,
            testIcons: IconMirror.allCases
        )

        XCTAssertEqual(difference.count, 0)
    }

    func test_icons_hasValidSnapshot() {
        Icon.allCases.forEach { assert(icon: $0) }
    }

    private func assert(icon: Icon) {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        label.font = .iconFont(ofSize: 24)
        label.text = icon.rawValue

        let identifier = "\(icon)"

        FBSnapshotVerifyView(label, identifier: identifier)
    }
}

extension IconTests {

    /**
     This enum only exist becuase Icon.swift is generate by an external tool.
     To be able to update snapshot tests, this file is need to compare diference between updates.
     Example: deleted Icons or renamed Icons
    */

    private enum IconMirror: String, CaseIterable {
        case filledActionAdd = "\u{EA01}"
        case filledActionCancel = "\u{EA02}"
        case filledActionCheck = "\u{EA03}"
        case filledActionDelete = "\u{EA04}"
        case filledActionNewrequest = "\u{EA05}"
        case filledActionRating = "\u{EA06}"
        case filledActionSubtract = "\u{EA07}"
        case filledBrandNaturarosacea = "\u{EA08}"
        case filledFinanceCharging = "\u{EA09}"
        case filledMediaPause = "\u{EA0A}"
        case filledMediaPlay = "\u{EA0B}"
        case filledMediaStop = "\u{EA0C}"
        case filledNavigationDirectionleft = "\u{EA0D}"
        case filledNavigationDirectionright = "\u{EA0E}"
        case filledNavigationDirectiontbottom = "\u{EA0F}"
        case filledNavigationDirectiontop = "\u{EA10}"
        case filledNavigationMenu = "\u{EA11}"
        case filledNavigationMore = "\u{EA12}"
        case filledProductBrandsproduct = "\u{EA13}"
        case filledSocialMyprofile = "\u{EA14}"
        case outlinedActionAdd = "\u{EA15}"
        case outlinedActionAddproduct = "\u{EA16}"
        case outlinedActionAttachment = "\u{EA17}"
        case outlinedActionAutofilter = "\u{EA18}"
        case outlinedActionCalendar = "\u{EA19}"
        case outlinedActionCamerachange = "\u{EA1A}"
        case outlinedActionCancel = "\u{EA1B}"
        case outlinedActionChange = "\u{EA1C}"
        case outlinedActionCheck = "\u{EA1D}"
        case outlinedActionClosedbox = "\u{EA1E}"
        case outlinedActionCopy = "\u{EA1F}"
        case outlinedActionCopylink = "\u{EA20}"
        case outlinedActionCycle = "\u{EA21}"
        case outlinedActionDelete = "\u{EA22}"
        case outlinedActionDone = "\u{EA23}"
        case outlinedActionDownload = "\u{EA24}"
        case outlinedActionEdit = "\u{EA25}"
        case outlinedActionFavorite = "\u{EA26}"
        case outlinedActionFilter = "\u{EA27}"
        case outlinedActionGridsquare = "\u{EA28}"
        case outlinedActionHelp = "\u{EA29}"
        case outlinedActionHistory = "\u{EA2A}"
        case outlinedActionLightoff = "\u{EA2B}"
        case outlinedActionLighton = "\u{EA2C}"
        case outlinedActionLike = "\u{EA2D}"
        case outlinedActionList = "\u{EA2E}"
        case outlinedActionLove = "\u{EA2F}"
        case outlinedActionMic = "\u{EA30}"
        case outlinedActionMicrec = "\u{EA31}"
        case outlinedActionNewregister = "\u{EA32}"
        case outlinedActionNewrequest = "\u{EA33}"
        case outlinedActionOrder = "\u{EA34}"
        case outlinedActionPhone = "\u{EA35}"
        case outlinedActionPrint = "\u{EA36}"
        case outlinedActionRating = "\u{EA37}"
        case outlinedActionRecycle = "\u{EA38}"
        case outlinedActionRequest = "\u{EA39}"
        case outlinedActionSave = "\u{EA3A}"
        case outlinedActionSchedule = "\u{EA3B}"
        case outlinedActionSearch = "\u{EA3C}"
        case outlinedActionSelectedalllines = "\u{EA3D}"
        case outlinedActionSend = "\u{EA3E}"
        case outlinedActionSettings = "\u{EA3F}"
        case outlinedActionShare = "\u{EA40}"
        case outlinedActionShareios = "\u{EA41}"
        case outlinedActionSubtract = "\u{EA42}"
        case outlinedActionText = "\u{EA43}"
        case outlinedActionUpdate = "\u{EA44}"
        case outlinedActionUpload = "\u{EA45}"
        case outlinedActionVisibility = "\u{EA46}"
        case outlinedActionVisibilityoff = "\u{EA47}"
        case outlinedAlertCancel = "\u{EA48}"
        case outlinedAlertCheck = "\u{EA49}"
        case outlinedAlertEmpty = "\u{EA4A}"
        case outlinedAlertIndeterminate = "\u{EA4B}"
        case outlinedAlertInfo = "\u{EA4C}"
        case outlinedAlertWarning = "\u{EA4D}"
        case outlinedCommunicationChat = "\u{EA4E}"
        case outlinedCommunicationEmail = "\u{EA4F}"
        case outlinedCommunicationHelp = "\u{EA50}"
        case outlinedCommunicationMessage = "\u{EA51}"
        case outlinedCommunicationOccurrence = "\u{EA52}"
        case outlinedCommunicationReadEmail = "\u{EA53}"
        case outlinedCommunicationSignal = "\u{EA54}"
        case outlinedCommunicationSpeaker = "\u{EA55}"
        case outlinedCommunicationTreatment = "\u{EA56}"
        case outlinedContentAdddocument = "\u{EA57}"
        case outlinedContentAgility = "\u{EA58}"
        case outlinedContentBellringing = "\u{EA59}"
        case outlinedContentBook = "\u{EA5A}"
        case outlinedContentBrightness = "\u{EA5B}"
        case outlinedContentChangeview = "\u{EA5C}"
        case outlinedContentChannel = "\u{EA5D}"
        case outlinedContentChristmascard = "\u{EA5E}"
        case outlinedContentConsistency = "\u{EA5F}"
        case outlinedContentDivulgation = "\u{EA60}"
        case outlinedContentEducation = "\u{EA61}"
        case outlinedContentExchangereports = "\u{EA62}"
        case outlinedContentGallery = "\u{EA63}"
        case outlinedContentGift = "\u{EA64}"
        case outlinedContentGlobal = "\u{EA65}"
        case outlinedContentHealth = "\u{EA66}"
        case outlinedContentHealthy = "\u{EA67}"
        case outlinedContentIndicator = "\u{EA68}"
        case outlinedContentLock = "\u{EA69}"
        case outlinedContentMagic = "\u{EA6A}"
        case outlinedContentMedal = "\u{EA6B}"
        case outlinedContentMenu = "\u{EA6C}"
        case outlinedContentMirror = "\u{EA6D}"
        case outlinedContentPlanb = "\u{EA6E}"
        case outlinedContentProdutivity = "\u{EA6F}"
        case outlinedContentReport = "\u{EA70}"
        case outlinedContentStore = "\u{EA71}"
        case outlinedContentWellness = "\u{EA72}"
        case outlinedContentWifi = "\u{EA73}"
        case outlinedDefaultMockup = "\u{EA74}"
        case outlinedFinanceBag = "\u{EA75}"
        case outlinedFinanceBank = "\u{EA76}"
        case outlinedFinanceCards = "\u{EA77}"
        case outlinedFinanceCharging = "\u{EA78}"
        case outlinedFinanceCreditcard = "\u{EA79}"
        case outlinedFinanceDebit = "\u{EA7A}"
        case outlinedFinanceDiscount = "\u{EA7B}"
        case outlinedFinanceLittlemachine = "\u{EA7C}"
        case outlinedFinanceMoney = "\u{EA7D}"
        case outlinedFinanceMoneypaper = "\u{EA7E}"
        case outlinedFinancePromotion = "\u{EA7F}"
        case outlinedFinanceShoppingcart = "\u{EA80}"
        case outlinedFinanceShoppingcartproduct = "\u{EA81}"
        case outlinedFinanceTagdiscount = "\u{EA82}"
        case outlinedFinanceTransfermoney = "\u{EA83}"
        case outlinedMediaApp = "\u{EA84}"
        case outlinedMediaCamera = "\u{EA85}"
        case outlinedMediaMonitor = "\u{EA86}"
        case outlinedMediaPlay = "\u{EA87}"
        case outlinedNavigationArrowbottom = "\u{EA88}"
        case outlinedNavigationArrowleft = "\u{EA89}"
        case outlinedNavigationArrowright = "\u{EA8A}"
        case outlinedNavigationArrowtop = "\u{EA8B}"
        case outlinedNavigationClose = "\u{EA8C}"
        case outlinedNavigationDirectionbottom = "\u{EA8D}"
        case outlinedNavigationDirectionleft = "\u{EA8E}"
        case outlinedNavigationDirectionright = "\u{EA8F}"
        case outlinedNavigationDirectiontop = "\u{EA90}"
        case outlinedNavigationExit = "\u{EA91}"
        case outlinedNavigationGoback = "\u{EA92}"
        case outlinedNavigationGofront = "\u{EA93}"
        case outlinedNavigationHome = "\u{EA94}"
        case outlinedNavigationMenu = "\u{EA95}"
        case outlinedPlaceBus = "\u{EA96}"
        case outlinedPlaceForklift = "\u{EA97}"
        case outlinedPlaceGps = "\u{EA98}"
        case outlinedPlaceLocal = "\u{EA99}"
        case outlinedPlaceTruck = "\u{EA9A}"
        case outlinedPlaceWaze = "\u{EA9B}"
        case outlinedProductBagproduct = "\u{EA9C}"
        case outlinedProductBeard = "\u{EA9D}"
        case outlinedProductBrandsproduct = "\u{EA9E}"
        case outlinedProductChildish = "\u{EA9F}"
        case outlinedProductDailycare = "\u{EAA0}"
        case outlinedProductHair = "\u{EAA1}"
        case outlinedProductMakeup = "\u{EAA2}"
        case outlinedProductOutlet = "\u{EAA3}"
        case outlinedProductPerfumery = "\u{EAA4}"
        case outlinedProductPromotionproduct = "\u{EAA5}"
        case outlinedProductVegan = "\u{EAA6}"
        case outlinedSocialAddcontact = "\u{EAA7}"
        case outlinedSocialBirthday = "\u{EAA8}"
        case outlinedSocialCollaborate = "\u{EAA9}"
        case outlinedSocialContact = "\u{EAAA}"
        case outlinedSocialDigitalconsultant = "\u{EAAB}"
        case outlinedSocialGroupofpeople = "\u{EAAC}"
        case outlinedSocialMyprofile = "\u{EAAD}"
        case outlinedSocialNetwork = "\u{EAAE}"
        case outlinedSocialPerson = "\u{EAAF}"
    }

    private func diffBetweenIcons(appIcons: [Icon], testIcons: [IconMirror]) -> [String] {
        let appIcons = testIcons.map { "\($0)" }
        let testIcons = appIcons.map { "\($0)" }

        let thisSet = Set(appIcons)
        let otherSet = Set(testIcons)

        return Array(thisSet.symmetricDifference(otherSet))
    }
}
