fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Run all Unit Tests
### ios fetch_certificates
```
fastlane ios fetch_certificates
```
Fetch the Development, AdHoc and Distribution Certificates
### ios pods_install
```
fastlane ios pods_install
```
Install cocoapods dependencies
### ios install
```
fastlane ios install
```
Install all project dependencies (npm & pods)
### ios build_prd_ipa
```
fastlane ios build_prd_ipa
```
Build IPA
### ios release_alpha
```
fastlane ios release_alpha
```
Release an Alpha version on Test Flight

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
