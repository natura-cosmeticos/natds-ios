# How to setup the project

Follow the steps below before opening the project.

  Installing dependencies:

1. Install project dependencies:
   ```
   make setup
   ```
2. ## Natura employees only:
   Note: before running this command, please contact System Team to request the required credentials

   ```
   make install_certificates
   ```

3. Done! Open project on Xcode using _.xcworkspace_

---

## Sample App

We have provided a sample project in the repository. To use it, download the repository, setup the project with the steps mentioned above and run `pod install` to download the required libraries. Then, open `NatDS.xcworkspace`. You'll see two schemes: `NatDS` and `NatDS-SampleApp` - select `NatDS-SampleApp`, build and run. Source files for this application are in the `NatDS-SampleApp/Sources` directory in the project navigator.

---

## Dependencies

- Xcode 12+
- Homebrew
- Ruby 2.6.5
- Bundler
- [Git-LFS](https://git-lfs.github.com/) for versions `6.2.0` and previous
