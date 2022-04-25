# How to contribute

## Setup
Check the required dependencies and setup the project using the [setup guide](docs/Setup.md). Create a new branch from `master` and code your solution.

The code is the folder `Sources > Public > Components`. If you're creating a new component, use the naming convention with a prefix. (Example: NatButton). You can use whatever structure you want to write your code, since it respects SOLID principles and keeps the component as flexible as possible.

## Code
If you created or updated a new component, include or update examples of your features in the Sample App: create a new View Controller in the target target `NatDS-Sample App` and folder `Sources > Sample > Components`. You should also include your new ViewController in the file `ComponentsSection`.

Your code should be covered by unit and snapshot tests. We use the libraries `Quick`, `Nimble` and `SnapshotTesting` to test the code.

Don't forget to document your new classes and methods. Use the shortcut `option + command + /` to open the documentation fields in Xcode.
## Commit structure
We use semantic commits in the project - you can follow the types and descriptions of [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/). 

> NOTE: The use of these commit messages is *MANDATORY*, as the new versions of the library are released using the commits as a source of information.

The most common types the we use are:
- `feat: [Short Description] [long description if you need]` (when adding a new feature)
- `bug: [Short Description] [long description if you need]` (when fixing a bug)
- `test: [Short Description] [long description if you need]` (when adding/updating tests)

There are other types that you can use to tag your commits: `build:`, `chore:`, `ci:`, `docs:`, `style:`, `refactor:`, `perf:`. [Check the description of each type of message](https://www.conventionalcommits.org/en/v1.0.0/).

### Tool to help:
We use the tool [Commitizen](https://github.com/commitizen/cz-cli) to help us use semantic commits.

To install Commitizen, run:

```bash
npm install -g commitizen
```

To commit your work, run:

```bash
git add .
git cz
```

## Create a PR
When opening a Pull Request with your changes, add a description of the changes and follow the checklist. Then, request a code review.