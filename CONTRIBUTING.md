# Contributing to the Project

First off, thanks for taking the time to contribute! 🎉👍

These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to
this document in a pull request.

This project is opinionated and follows patterns and practices used by the team at
[Cardinal][cardinal_run_link].

## Proposing a changes & reporting bugs

If you intend to change the public API or make any non-trivial changes to the implementation, we 
recommend filing an issue. This lets us reach an agreement on your proposal before you put 
significant effort into it.

If you’re only fixing a bug, it’s fine to submit a pull request right away but we still recommend 
to [filing an issue][issue_creation_link] detailing what you’re fixing. This is helpful in case we 
don’t accept that specific fix but want to keep track of the issue. Please use the built-in Bug 
Report template and provide as much information as possible including detailed reproduction steps. 
Once one of the package maintainers has reviewed the issue and an agreement is reached regarding the
fix, a pull request can be created.

## Creating a Pull Request

Before creating a pull request please:

1. Fork the repository and create your branch from `main`.
1. Install all dependencies (`flutter pub get`).
1. Squash your commits and ensure you have a meaningful, [semantic][conventional_commits_link] 
   commit message.
1. Add tests! Pull Requests that lower our test coverage will not be merged.
1. Ensure the existing test suite passes locally (`./tool/run_tests.sh`).
1. Format your code (`dart format .`).
1. Analyze your code (`dart analyze --fatal-infos --fatal-warnings .`).
1. Create the Pull Request.
1. Verify that all status checks are passing.

While the prerequisites above must be satisfied prior to having your pull request reviewed, the 
reviewer(s) may ask you to complete additional work, tests, or other changes before your pull 
request can be ultimately accepted.

## Setting 

[conventional_commits_link]: https://www.conventionalcommits.org/en/v1.0.0
[issue_creation_link]: https://github.com/cardinal.run/fingerprint/issues/new/choose
[cardinal_run_link]: https://cardinal.run
[git_link]: https://git-scm.com/
[flutter_link]: https://flutter.dev