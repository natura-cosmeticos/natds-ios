.DEFAULT_GOAL := help
BUNDLE=$(if $(rbenv > /dev/null), rbenv exec bundle, bundle)
FASTLANE=$(BUNDLE) exec fastlane

install: ## install required dependencies - CI Only
	make install_bundle
	$(FASTLANE) install

setup: ## intalls project dependencies
	cd scripts && ./setup.sh all && cd ..

	brew install rbenv
	rbenv install 2.6.5

	gem install bundler
	
	brew install git-lfs
	git lfs install
	
	make install_bundle

	pods_install

	@echo "\033[1;33m"
	@echo "-----------------------------------------------------------"
	@echo "Restart all your terminals to ensure the setup takes effect"
	@echo "-----------------------------------------------------------"
	@echo "\033[0m"

install_bundle: ## install gems
	$(BUNDLE) install
	$(BUNDLE) update --all

xcode_wipe: ## delete all xcode cached outputs, kill and reset all simulators
	-rm -rf ~/Library/Developer/Xcode/{DerivedData,Archives,Products}
	make reset_simulator

reset_simulator: ## reset all iOS Simulators
	-osascript -e 'tell application "Simulator" to quit'
	-xcrun simctl shutdown all
	-xcrun simctl erase all

pods_wipe: ## removes Pods folder, clean its cache and reinstall all Cocoapods dependencies
	pod cache clean --all
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf ~/Library/Caches/CocoaPods/*
	$(FASTLANE) pods_install

install_certificates: ## fetch and install certificates for code signing
	$(FASTLANE) fetch_certificates

test_unit: ## run unit tests
	$(FASTLANE) test_unit

test_snapshot: ## run snapshot tests
	$(FASTLANE) test_snapshot

build_ipa: ## builds the ipa file for environment (Ad Hoc)
	$(FASTLANE) build_ipa

release_alpha: ## builds the app using scheme and sends it to Test Flight
	$(FASTLANE) release_alpha

update_patch: ## updates SampleApp and DS Lib versions with next Patch (Y.Y.X) number, also tag and commit
	$(FASTLANE) update_patch

bump_version: ## releases new version of NatDS
	bash ./scripts/bump_version.sh

update_themes: ## update theme from commons
	bash ./scripts/update_themes.sh

update_icons: ## update icons in ios
	bash ./scripts/update_icons.sh

create_docs: ## creates html docs
	gem install jazzy
	jazzy --theme=jony
	bash ./scripts/update_docs.sh

teams_release_notification: ## sends a notification on teams about a new available version
	bash ./scripts/message_teams.sh

update_profiles:
	$(FASTLANE) renew_certificates

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
