# How to contribute - WIP

Are you feeling that you can help us with anything in the project? Just get closer!!

There are many ways to contribute, check some of them:
## Do you want add something in the project? Just create a PR
We will review your PR, checking some criteria and if everything is fine, a new version of the lib will be publish with your contribution ASAP!

### Commits structure
To commit your PR, we indicate the usage of [Conversional Commits] (https://www.conventionalcommits.org/en/v1.0.0/).

The most common types the we use is:
Are you adding a new feature, your commit should look like: feat: [Short Description] [long description if you need]
Are you fixing a bug, your commit should look like: bug: [Short Description] [long description if you need]
Are you adding tests, your commit should look like: test: [Short Description] [long description if you need]

There are many other types that you can use to tag your commits: build:, chore:, ci:, docs:, style:, refactor:, perf:
[here you can find more info about it](https://www.conventionalcommits.org/en/v1.0.0/).

#### Tool to help:
You can add an CLI to help you writing your commits. [Commitizen](https://github.com/commitizen/cz-cli) is the tool we use :)

##### Install the CLI
```bash
npm install -g commitizen
```
###### Do your work and commit
```bash
git add .
git cz
```

Commitizen will guide you about how to structure you commit

## Dependencies
- Xcode 11.6+
- Homebrew
- Ruby 2.6.5
- Bundler
- [Git-LFS](https://git-lfs.github.com/)

---
## Before open the project ##
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

## Sample
We have provided a sample project in the repository. To use it, download the repository, run `pod install` to download the required libraries and open NatDS.xcworkspace. You'll see two schemes: NatDS and NatDS-SampleApp - select the NatDS-SampleApp and then build & run! Source files for these are in the NatDS-SampleApp/Sources directory in project navigator.
