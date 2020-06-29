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
### install
```
fastlane install
```
CI Only - Install all project dependencies (npm & pods)
### pods_install
```
fastlane pods_install
```
Install cocoapods dependencies

----

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
### ios release_alpha
```
fastlane ios release_alpha
```
Release an Alpha version on Test Flight
### ios build_ipa
```
fastlane ios build_ipa
```

### ios update_major
```
fastlane ios update_major
```
Updates SampleApp and DS Lib versions with next Major (X.Y.Y) number, also tag and commit it.
### ios update_minor
```
fastlane ios update_minor
```
Updates SampleApp and DS Lib versions with next Minor (Y.X.Y) number, also tag and commit.
### ios update_patch
```
fastlane ios update_patch
```
Updates SampleApp and DS Lib versions with next Patch (Y.Y.X) number, also tag and commit.

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
