//
//  GaYaColors.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 22/08/24.
//  Copyright © 2024 Natura. All rights reserved.
//

import Foundation


public struct GaYaColors {
    
    // MARK: - Init
    
    private init() {}
    
    public static var neutral0: UIColor { getUIColorFromTokens(\.colorNeutral0) }
    public static var neutral50: UIColor { getUIColorFromTokens(\.colorNeutral50) }
    public static var neutral100: UIColor { getUIColorFromTokens(\.colorNeutral100) }
    public static var neutral200: UIColor { getUIColorFromTokens(\.colorNeutral200) }
    public static var neutral300: UIColor { getUIColorFromTokens(\.colorNeutral300) }
    public static var neutral400: UIColor { getUIColorFromTokens(\.colorNeutral400) }
    public static var neutral500: UIColor { getUIColorFromTokens(\.colorNeutral500) }
    public static var neutral600: UIColor { getUIColorFromTokens(\.colorNeutral600) }
    public static var neutral700: UIColor { getUIColorFromTokens(\.colorNeutral700) }
    public static var neutral800: UIColor { getUIColorFromTokens(\.colorNeutral800) }
    public static var neutral900: UIColor { getUIColorFromTokens(\.colorNeutral900) }
    public static var surface: UIColor { getUIColorFromTokens(\.colorSurface) }
    public static var surfaceDark: UIColor { getUIColorFromTokens(\.colorSurfaceDark) }
    public static var surfaceFixedLight: UIColor { getUIColorFromTokens(\.colorSurfaceFixedLight) }
    public static var surfaceFixedDark: UIColor { getUIColorFromTokens(\.colorSurfaceFixedDark) }
    public static var surfaceDisabled: UIColor { getUIColorFromTokens(\.colorSurfaceDisabled) }
    public static var onSurface: UIColor { getUIColorFromTokens(\.colorOnSurface) }
    public static var onSurfaceDark: UIColor { getUIColorFromTokens(\.colorOnSurfaceDark) }
    public static var onSurfaceFixedLight: UIColor { getUIColorFromTokens(\.colorOnSurfaceFixedLight) }
    public static var onSurfaceFixedDark: UIColor { getUIColorFromTokens(\.colorOnSurfaceFixedDark) }
    public static var onSurfaceDisabled: UIColor { getUIColorFromTokens(\.colorOnSurfaceDisabled) }
    public static var surfaceInverse: UIColor { getUIColorFromTokens(\.colorSurfaceInverse) }
    public static var onSurfaceInverse: UIColor { getUIColorFromTokens(\.colorOnSurfaceInverse) }
    public static var highlight: UIColor { getUIColorFromTokens(\.colorHighlight) }
    public static var highEmphasis: UIColor { getUIColorFromTokens(\.colorHighEmphasis) }
    public static var mediumEmphasis: UIColor { getUIColorFromTokens(\.colorMediumEmphasis) }
    public static var lowEmphasis: UIColor { getUIColorFromTokens(\.colorLowEmphasis) }
    public static var lowLight: UIColor { getUIColorFromTokens(\.colorLowLight) }
    public static var info: UIColor { getUIColorFromTokens(\.colorInfo) }
    public static var onInfo: UIColor { getUIColorFromTokens(\.colorOnInfo) }
    public static var infoLight: UIColor { getUIColorFromTokens(\.colorInfoLight) }
    public static var onInfoLight: UIColor { getUIColorFromTokens(\.colorOnInfoLight) }
    public static var infoLightest: UIColor { getUIColorFromTokens(\.colorInfoLightest) }
    public static var onInfoLightest: UIColor { getUIColorFromTokens(\.colorOnInfoLightest) }
    public static var infoDark: UIColor { getUIColorFromTokens(\.colorInfoDark) }
    public static var onInfoDark: UIColor { getUIColorFromTokens(\.colorOnInfoDark) }
    public static var infoDarkest: UIColor { getUIColorFromTokens(\.colorInfoDarkest) }
    public static var onInfoDarkest: UIColor { getUIColorFromTokens(\.colorOnInfoDarkest) }
    public static var link: UIColor { getUIColorFromTokens(\.colorLink) }
    public static var onLink: UIColor { getUIColorFromTokens(\.colorOnLink) }
    public static var linkLight: UIColor { getUIColorFromTokens(\.colorLinkLight) }
    public static var onLinkLight: UIColor { getUIColorFromTokens(\.colorOnLinkLight) }
    public static var linkLightest: UIColor { getUIColorFromTokens(\.colorLinkLightest) }
    public static var onLinkLightest: UIColor { getUIColorFromTokens(\.colorOnLinkLightest) }
    public static var linkDark: UIColor { getUIColorFromTokens(\.colorLinkDark) }
    public static var onLinkDark: UIColor { getUIColorFromTokens(\.colorOnLinkDark) }
    public static var linkDarkest: UIColor { getUIColorFromTokens(\.colorLinkDarkest) }
    public static var onLinkDarkest: UIColor { getUIColorFromTokens(\.colorOnLinkDarkest) }
    public static var success: UIColor { getUIColorFromTokens(\.colorSuccess) }
    public static var onSuccess: UIColor { getUIColorFromTokens(\.colorOnSuccess) }
    public static var successLight: UIColor { getUIColorFromTokens(\.colorSuccessLight) }
    public static var onSuccessLight: UIColor { getUIColorFromTokens(\.colorOnSuccessLight) }
    public static var successLightest: UIColor { getUIColorFromTokens(\.colorSuccessLightest) }
    public static var onSuccessLightest: UIColor { getUIColorFromTokens(\.colorOnSuccessLightest) }
    public static var successDark: UIColor { getUIColorFromTokens(\.colorSuccessDark) }
    public static var onSuccessDark: UIColor { getUIColorFromTokens(\.colorOnSuccessDark) }
    public static var successDarkest: UIColor { getUIColorFromTokens(\.colorSuccessDarkest) }
    public static var onSuccessDarkest: UIColor { getUIColorFromTokens(\.colorOnSuccessDarkest) }
    public static var warning: UIColor { getUIColorFromTokens(\.colorWarning) }
    public static var onWarning: UIColor { getUIColorFromTokens(\.colorOnWarning) }
    public static var warningLight: UIColor { getUIColorFromTokens(\.colorWarningLight) }
    public static var onWarningLight: UIColor { getUIColorFromTokens(\.colorOnWarningLight) }
    public static var warningLightest: UIColor { getUIColorFromTokens(\.colorWarningLightest) }
    public static var onWarningLightest: UIColor { getUIColorFromTokens(\.colorOnWarningLightest) }
    public static var warningDark: UIColor { getUIColorFromTokens(\.colorWarningDark) }
    public static var onWarningDark: UIColor { getUIColorFromTokens(\.colorOnWarningDark) }
    public static var warningDarkest: UIColor { getUIColorFromTokens(\.colorWarningDarkest) }
    public static var onWarningDarkest: UIColor { getUIColorFromTokens(\.colorOnWarningDarkest) }
    public static var alert: UIColor { getUIColorFromTokens(\.colorAlert) }
    public static var onAlert: UIColor { getUIColorFromTokens(\.colorOnAlert) }
    public static var alertLight: UIColor { getUIColorFromTokens(\.colorAlertLight) }
    public static var onAlertLight: UIColor { getUIColorFromTokens(\.colorOnAlertLight) }
    public static var alertLightest: UIColor { getUIColorFromTokens(\.colorAlertLightest) }
    public static var onAlertLightest: UIColor { getUIColorFromTokens(\.colorOnAlertLightest) }
    public static var alertDark: UIColor { getUIColorFromTokens(\.colorAlertDark) }
    public static var onAlertDark: UIColor { getUIColorFromTokens(\.colorOnAlertDark) }
    public static var alertDarkest: UIColor { getUIColorFromTokens(\.colorAlertDarkest) }
    public static var onAlertDarkest: UIColor { getUIColorFromTokens(\.colorOnAlertDarkest) }
    public static var neutralLightest: UIColor { getUIColorFromTokens(\.colorNeutralLightest) }
    public static var neutralLight: UIColor { getUIColorFromTokens(\.colorNeutralLight) }
    public static var neutralMedium: UIColor { getUIColorFromTokens(\.colorNeutralMedium) }
    public static var neutralDark: UIColor { getUIColorFromTokens(\.colorNeutralDark) }
    public static var neutralDarkest: UIColor { getUIColorFromTokens(\.colorNeutralDarkest) }
    public static var primary: UIColor { getUIColorFromTokens(\.colorPrimary) }
    public static var onPrimary: UIColor { getUIColorFromTokens(\.colorOnPrimary) }
    public static var primaryLight: UIColor { getUIColorFromTokens(\.colorPrimaryLight) }
    public static var onPrimaryLight: UIColor { getUIColorFromTokens(\.colorOnPrimaryLight) }
    public static var primaryLightest: UIColor { getUIColorFromTokens(\.colorPrimaryLightest) }
    public static var onPrimaryLightest: UIColor { getUIColorFromTokens(\.colorOnPrimaryLightest) }
    public static var primaryDark: UIColor { getUIColorFromTokens(\.colorPrimaryDark) }
    public static var onPrimaryDark: UIColor { getUIColorFromTokens(\.colorOnPrimaryDark) }
    public static var primaryDarkest: UIColor { getUIColorFromTokens(\.colorPrimaryDarkest) }
    public static var onPrimaryDarkest: UIColor { getUIColorFromTokens(\.colorOnPrimaryDarkest) }
    public static var secondary: UIColor { getUIColorFromTokens(\.colorSecondary) }
    public static var onSecondary: UIColor { getUIColorFromTokens(\.colorOnSecondary) }
    public static var secondaryLight: UIColor { getUIColorFromTokens(\.colorSecondaryLight) }
    public static var onSecondaryLight: UIColor { getUIColorFromTokens(\.colorOnSecondaryLight) }
    public static var secondaryLightest: UIColor { getUIColorFromTokens(\.colorSecondaryLightest) }
    public static var onSecondaryLightest: UIColor { getUIColorFromTokens(\.colorOnSecondaryLightest) }
    public static var secondaryDark: UIColor { getUIColorFromTokens(\.colorSecondaryDark) }
    public static var onSecondaryDark: UIColor { getUIColorFromTokens(\.colorOnSecondaryDark) }
    public static var secondaryDarkest: UIColor { getUIColorFromTokens(\.colorSecondaryDarkest) }
    public static var onSecondaryDarkest: UIColor { getUIColorFromTokens(\.colorOnSecondaryDarkest) }
    public static var contentHighlight: UIColor { getUIColorFromTokens(\.colorContentHighlight) }
    public static var contentHighEmphasis: UIColor { getUIColorFromTokens(\.colorContentHighEmphasis) }
    public static var contentMediumEmphasis: UIColor { getUIColorFromTokens(\.colorContentMediumEmphasis) }
    public static var contentLowEmphasis: UIColor { getUIColorFromTokens(\.colorContentLowEmphasis) }
    public static var contentDisabled: UIColor { getUIColorFromTokens(\.colorContentDisabled) }
    public static var contentHighlightFixedLight: UIColor { getUIColorFromTokens(\.colorContentHighlightFixedLight) }
    public static var contentHighEmphasisFixedLight: UIColor { getUIColorFromTokens(\.colorContentHighEmphasisFixedLight) }
    public static var contentMediumEmphasisFixedLight: UIColor { getUIColorFromTokens(\.colorContentMediumEmphasisFixedLight) }
    public static var contentLowEmphasisFixedLight: UIColor { getUIColorFromTokens(\.colorContentLowEmphasisFixedLight) }
}
