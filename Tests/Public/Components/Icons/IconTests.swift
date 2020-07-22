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

    func test_difference_between_icons_and_test_mirror_raw_value() {
        let iconsMirror = Icon.allCases.compactMap { IconMirror(rawValue: $0.rawValue) }

        XCTAssertEqual(iconsMirror.count, Icon.allCases.count)
    }

    func test_icons_hasValidSnapshot() {
        Icon.allCases.forEach { assert(icon: $0) }
    }

    private func assert(icon: Icon) {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        label.font = .iconFont(ofSize: 24)
        label.text = icon.unicode

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
        case filledActionAdd = "filled-action-add"
        case filledActionCancel = "filled-action-cancel"
        case filledActionCheck = "filled-action-check"
        case filledActionDelete = "filled-action-delete"
        case filledActionNewrequest = "filled-action-newrequest"
        case filledActionRating = "filled-action-rating"
        case filledActionSubtract = "filled-action-subtract"
        case filledBrandFacebook = "filled-brand-facebook"
        case filledBrandGoogle = "filled-brand-google"
        case filledBrandInstagram = "filled-brand-instagram"
        case filledBrandLinkedin = "filled-brand-linkedin"
        case filledBrandNaturarosacea = "filled-brand-naturarosacea"
        case filledBrandPinterest = "filled-brand-pinterest"
        case filledBrandSpotify = "filled-brand-spotify"
        case filledBrandTwitter = "filled-brand-twitter"
        case filledBrandWhatsapp = "filled-brand-whatsapp"
        case filledBrandYoutube = "filled-brand-youtube"
        case filledFinanceCharging = "filled-finance-charging"
        case filledMediaPause = "filled-media-pause"
        case filledMediaPlay = "filled-media-play"
        case filledMediaStop = "filled-media-stop"
        case filledNavigationDirectionleft = "filled-navigation-directionleft"
        case filledNavigationDirectionright = "filled-navigation-directionright"
        case filledNavigationDirectiontbottom = "filled-navigation-directiontbottom"
        case filledNavigationDirectiontop = "filled-navigation-directiontop"
        case filledNavigationMenu = "filled-navigation-menu"
        case filledNavigationMore = "filled-navigation-more"
        case filledProductBrandsproduct = "filled-product-brandsproduct"
        case filledSocialMyprofile = "filled-social-myprofile"
        case outlinedActionAdd = "outlined-action-add"
        case outlinedActionAddproduct = "outlined-action-addproduct"
        case outlinedActionAttachment = "outlined-action-attachment"
        case outlinedActionAutofilter = "outlined-action-autofilter"
        case outlinedActionCalendar = "outlined-action-calendar"
        case outlinedActionCamerachange = "outlined-action-camerachange"
        case outlinedActionCancel = "outlined-action-cancel"
        case outlinedActionChange = "outlined-action-change"
        case outlinedActionCheck = "outlined-action-check"
        case outlinedActionClosedbox = "outlined-action-closedbox"
        case outlinedActionCopy = "outlined-action-copy"
        case outlinedActionCopylink = "outlined-action-copylink"
        case outlinedActionCycle = "outlined-action-cycle"
        case outlinedActionDelete = "outlined-action-delete"
        case outlinedActionDone = "outlined-action-done"
        case outlinedActionDownload = "outlined-action-download"
        case outlinedActionEdit = "outlined-action-edit"
        case outlinedActionFavorite = "outlined-action-favorite"
        case outlinedActionFilter = "outlined-action-filter"
        case outlinedActionGridsquare = "outlined-action-gridsquare"
        case outlinedActionHelp = "outlined-action-help"
        case outlinedActionHistory = "outlined-action-history"
        case outlinedActionLightoff = "outlined-action-lightoff"
        case outlinedActionLighton = "outlined-action-lighton"
        case outlinedActionLike = "outlined-action-like"
        case outlinedActionList = "outlined-action-list"
        case outlinedActionLove = "outlined-action-love"
        case outlinedActionMic = "outlined-action-mic"
        case outlinedActionMicrec = "outlined-action-micrec"
        case outlinedActionNewregister = "outlined-action-newregister"
        case outlinedActionNewrequest = "outlined-action-newrequest"
        case outlinedActionOrder = "outlined-action-order"
        case outlinedActionPhone = "outlined-action-phone"
        case outlinedActionPrint = "outlined-action-print"
        case outlinedActionRating = "outlined-action-rating"
        case outlinedActionRecycle = "outlined-action-recycle"
        case outlinedActionRequest = "outlined-action-request"
        case outlinedActionSave = "outlined-action-save"
        case outlinedActionSchedule = "outlined-action-schedule"
        case outlinedActionSearch = "outlined-action-search"
        case outlinedActionSelectedalllines = "outlined-action-selectedalllines"
        case outlinedActionSend = "outlined-action-send"
        case outlinedActionSettings = "outlined-action-settings"
        case outlinedActionShare = "outlined-action-share"
        case outlinedActionShareios = "outlined-action-shareios"
        case outlinedActionSubtract = "outlined-action-subtract"
        case outlinedActionText = "outlined-action-text"
        case outlinedActionUpdate = "outlined-action-update"
        case outlinedActionUpload = "outlined-action-upload"
        case outlinedActionVisibility = "outlined-action-visibility"
        case outlinedActionVisibilityoff = "outlined-action-visibilityoff"
        case outlinedAlertCancel = "outlined-alert-cancel"
        case outlinedAlertCheck = "outlined-alert-check"
        case outlinedAlertEmpty = "outlined-alert-empty"
        case outlinedAlertIndeterminate = "outlined-alert-indeterminate"
        case outlinedAlertInfo = "outlined-alert-info"
        case outlinedAlertNotification = "outlined-alert-notification"
        case outlinedAlertWarning = "outlined-alert-warning"
        case outlinedCommunicationChat = "outlined-communication-chat"
        case outlinedCommunicationEmail = "outlined-communication-email"
        case outlinedCommunicationHelp = "outlined-communication-help"
        case outlinedCommunicationMessage = "outlined-communication-message"
        case outlinedCommunicationOccurrence = "outlined-communication-occurrence"
        case outlinedCommunicationReadEmail = "outlined-communication-readEmail"
        case outlinedCommunicationSignal = "outlined-communication-signal"
        case outlinedCommunicationSpeaker = "outlined-communication-speaker"
        case outlinedCommunicationTreatment = "outlined-communication-treatment"
        case outlinedContentAdddocument = "outlined-content-adddocument"
        case outlinedContentAgility = "outlined-content-agility"
        case outlinedContentBellringing = "outlined-content-bellringing"
        case outlinedContentBook = "outlined-content-book"
        case outlinedContentBrightness = "outlined-content-brightness"
        case outlinedContentChangeview = "outlined-content-changeview"
        case outlinedContentChannel = "outlined-content-channel"
        case outlinedContentChristmascard = "outlined-content-christmascard"
        case outlinedContentConsistency = "outlined-content-consistency"
        case outlinedContentDivulgation = "outlined-content-divulgation"
        case outlinedContentEducation = "outlined-content-education"
        case outlinedContentExchangereports = "outlined-content-exchangereports"
        case outlinedContentGallery = "outlined-content-gallery"
        case outlinedContentGift = "outlined-content-gift"
        case outlinedContentGlobal = "outlined-content-global"
        case outlinedContentHealth = "outlined-content-health"
        case outlinedContentHealthy = "outlined-content-healthy"
        case outlinedContentIndicator = "outlined-content-indicator"
        case outlinedContentLock = "outlined-content-lock"
        case outlinedContentMagic = "outlined-content-magic"
        case outlinedContentMedal = "outlined-content-medal"
        case outlinedContentMenu = "outlined-content-menu"
        case outlinedContentMirror = "outlined-content-mirror"
        case outlinedContentPlanb = "outlined-content-planb"
        case outlinedContentProdutivity = "outlined-content-produtivity"
        case outlinedContentReport = "outlined-content-report"
        case outlinedContentStore = "outlined-content-store"
        case outlinedContentWellness = "outlined-content-wellness"
        case outlinedContentWifi = "outlined-content-wifi"
        case outlinedDefaultMockup = "outlined-default-mockup"
        case outlinedFinanceBag = "outlined-finance-bag"
        case outlinedFinanceBank = "outlined-finance-bank"
        case outlinedFinanceCards = "outlined-finance-cards"
        case outlinedFinanceCharging = "outlined-finance-charging"
        case outlinedFinanceCreditcard = "outlined-finance-creditcard"
        case outlinedFinanceDebit = "outlined-finance-debit"
        case outlinedFinanceDiscount = "outlined-finance-discount"
        case outlinedFinanceLittlemachine = "outlined-finance-littlemachine"
        case outlinedFinanceMoney = "outlined-finance-money"
        case outlinedFinanceMoneypaper = "outlined-finance-moneypaper"
        case outlinedFinancePromotion = "outlined-finance-promotion"
        case outlinedFinanceShoppingcart = "outlined-finance-shoppingcart"
        case outlinedFinanceShoppingcartproduct = "outlined-finance-shoppingcartproduct"
        case outlinedFinanceTagdiscount = "outlined-finance-tagdiscount"
        case outlinedFinanceTransfermoney = "outlined-finance-transfermoney"
        case outlinedMediaApp = "outlined-media-app"
        case outlinedMediaCamera = "outlined-media-camera"
        case outlinedMediaMonitor = "outlined-media-monitor"
        case outlinedMediaPlay = "outlined-media-play"
        case outlinedNavigationArrowbottom = "outlined-navigation-arrowbottom"
        case outlinedNavigationArrowleft = "outlined-navigation-arrowleft"
        case outlinedNavigationArrowright = "outlined-navigation-arrowright"
        case outlinedNavigationArrowtop = "outlined-navigation-arrowtop"
        case outlinedNavigationClose = "outlined-navigation-close"
        case outlinedNavigationDirectionbottom = "outlined-navigation-directionbottom"
        case outlinedNavigationDirectionleft = "outlined-navigation-directionleft"
        case outlinedNavigationDirectionright = "outlined-navigation-directionright"
        case outlinedNavigationDirectiontop = "outlined-navigation-directiontop"
        case outlinedNavigationExit = "outlined-navigation-exit"
        case outlinedNavigationGoback = "outlined-navigation-goback"
        case outlinedNavigationGofront = "outlined-navigation-gofront"
        case outlinedNavigationHome = "outlined-navigation-home"
        case outlinedNavigationMenu = "outlined-navigation-menu"
        case outlinedPlaceBus = "outlined-place-bus"
        case outlinedPlaceForklift = "outlined-place-forklift"
        case outlinedPlaceGps = "outlined-place-gps"
        case outlinedPlaceLocal = "outlined-place-local"
        case outlinedPlaceRocket = "outlined-place-rocket"
        case outlinedPlaceRunningtruck = "outlined-place-runningtruck"
        case outlinedPlaceTruck = "outlined-place-truck"
        case outlinedPlaceWaze = "outlined-place-waze"
        case outlinedProductBagproduct = "outlined-product-bagproduct"
        case outlinedProductBeard = "outlined-product-beard"
        case outlinedProductBrandsproduct = "outlined-product-brandsproduct"
        case outlinedProductChildish = "outlined-product-childish"
        case outlinedProductDailycare = "outlined-product-dailycare"
        case outlinedProductHair = "outlined-product-hair"
        case outlinedProductMakeup = "outlined-product-makeup"
        case outlinedProductOutlet = "outlined-product-outlet"
        case outlinedProductPerfumery = "outlined-product-perfumery"
        case outlinedProductPromotionproduct = "outlined-product-promotionproduct"
        case outlinedProductVegan = "outlined-product-vegan"
        case outlinedSocialAddcontact = "outlined-social-addcontact"
        case outlinedSocialBirthday = "outlined-social-birthday"
        case outlinedSocialCollaborate = "outlined-social-collaborate"
        case outlinedSocialContact = "outlined-social-contact"
        case outlinedSocialDigitalconsultant = "outlined-social-digitalconsultant"
        case outlinedSocialGroupofpeople = "outlined-social-groupofpeople"
        case outlinedSocialMyprofile = "outlined-social-myprofile"
        case outlinedSocialNetwork = "outlined-social-network"
        case outlinedSocialPerson = "outlined-social-person"
    }

    private func diffBetweenIcons(appIcons: [Icon], testIcons: [IconMirror]) -> [String] {
        let appIcons = testIcons.map { "\($0)" }
        let testIcons = appIcons.map { "\($0)" }

        let thisSet = Set(appIcons)
        let otherSet = Set(testIcons)

        return Array(thisSet.symmetricDifference(otherSet))
    }
}
