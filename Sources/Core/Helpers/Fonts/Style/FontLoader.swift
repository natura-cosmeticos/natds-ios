//
//  FontLoader.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 17/03/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit
import CoreText

struct FontLoader {
    static var loadedFonts: Set<String> = []

    static func loadFontIfNeeded(named fontName: String) {
        guard !loadedFonts.contains(fontName) else { return }

        let bundle = Bundle.main
        guard let fontURL = bundle.url(forResource: fontName, withExtension: "ttf") ??
                            bundle.url(forResource: fontName, withExtension: "otf") else {
            return
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("⚠️ Falha ao registrar a fonte \(fontName): \(String(describing: error?.takeRetainedValue()))")
        } else {
            loadedFonts.insert(fontName)
        }
    }
}
