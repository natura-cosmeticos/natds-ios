# How to contribute

First of all, check the required dependencies, setup the project using [the steps in the setup guide](docs/Setup.md) and start coding. Use the commit structure and follow the criteria below before creating a PR. 

## Requirements
If you created or updated a new component, don't forget to include examples of your features in the Sample App. New components and features must be documented and covered by unit and snapshot tests.

## Commits structure

After developing your contribution, we recommend the usage of [Conventional Commits] (https://www.conventionalcommits.org/en/v1.0.0/) to commit your work.

The most common types the we use are:
- If you're adding a new feature, your commit should look like: `feat: [Short Description] [long description if you need]`
- If you're fixing a bug, your commit should look like: `bug: [Short Description] [long description if you need]`
- If you're adding tests, your commit should look like: `test: [Short Description] [long description if you need]`

There are many other types that you can use to tag your commits: `build:`, `chore:`, `ci:`, `docs:`, `style:`, `refactor:`, `perf:`; 
[here you can find more info about it](https://www.conventionalcommits.org/en/v1.0.0/).

NOTE: The conventional commits structure is mandatory, as the new versions of the library are released using the commits as a source of information.

### Tool to help:
You can add an CLI to help you writing your commits. [Commitizen](https://github.com/commitizen/cz-cli) is the tool we use :)

To install the CLI, run:

```bash
npm install -g commitizen
```

To commit your work with Commitizen, run:

```bash
git add .
git cz
```

Commitizen will guide you about how to structure you commit.

After documenting your code, you'll also have to update the documentation files. To do that, run:
```bash
make create_docs
```

## Create a PR to contribute to the project

We will review your PR checking some criteria:

- Your code is covered by tests
- Your code is well structured, respecting SOLID principles
- Your code passed our automatic verifications (you can check the pipeline flow link in your PR)
- You've added a sample of the increment to the Sample App (remember to update the tests related to it)
- You have made the corresponding changes to the documentation
- Your changes don't generate new warnings
- The component works fine with dark mode enabled
- Your code uses Design System design tokens

If there's something that we could improve in the library, feel free to open an issue and let us know. We'll be happy to get in touch! :)
