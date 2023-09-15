func getTokenFromTheme<T>(_ keyPath: KeyPath<Tokens, T>) -> T {
    getThemeValidated(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    ).tokens[keyPath: keyPath]
}

func getTokenFromTheme(_ tokenName: String) -> Any? {
    let theme = getThemeValidated(
        from: ConfigurationStorage.shared,
        fatalError: designSystemFatalError
    )
    return theme.tokens.mapping[tokenName]
}

extension Tokens {
    var mapping: [String: Any] {
        return [
            // Modelo A
            "assetBrandNeutralAFile": self.assetBrandNeutralAFile,
            "assetBrandNeutralAEsFile": self.assetBrandNeutralAEsFile,
            "assetBrandNeutralAPtFile": self.assetBrandNeutralAPtFile,
            "assetBrandCustomAFile": self.assetBrandCustomAFile,
            "assetBrandCustomAEsFile": self.assetBrandCustomAEsFile,
            "assetBrandCustomAPtFile": self.assetBrandCustomAPtFile,
                        
            // Modelo B
            "assetBrandNeutralBFile": self.assetBrandNeutralBFile,
            "assetBrandNeutralBEsFile": self.assetBrandNeutralBEsFile,
            "assetBrandNeutralBPtFile": self.assetBrandNeutralBPtFile,
            "assetBrandCustomBFile": self.assetBrandCustomBFile,
            "assetBrandCustomBEsFile": self.assetBrandCustomBEsFile,
            "assetBrandCustomBPtFile": self.assetBrandCustomBPtFile,
        ]
    }
}
