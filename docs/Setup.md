# How to setup the project

## Dependencies

- Xcode 12+
- Homebrew
- Ruby 2.6.5
- Bundler
- [Git-LFS](https://git-lfs.github.com/) for versions `6.2.0` and previous

---

## Setup dependencies

1. Install dependencies running:
   ```
   make setup
   ```

2. Open the project on Xcode using the file _.xcworkspace_

---

## Setup Sample App

We have provided a sample project in the repository. To use it, download the repository, setup the project with the steps mentioned above and run `pod install` to download the required libraries. Then, open `NatDS.xcworkspace`. You'll see two schemes: `NatDS` and `NatDS-SampleApp` - select `NatDS-SampleApp`, build and run. Source files for this application are in the `NatDS-SampleApp/Sources` directory in the project navigator.