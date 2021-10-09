# exercism-solutions
These are my solutions to the lessons I take on exercism.org

To run tests or watch files for TDD you need to install [bundler](https://bundler.io/) for Ruby and/or
[yarn](https://classic.yarnpkg.com/lang/en/docs/install) for JavaScript then run either or both of these:

```bash
bundle install
yarn install
```
Afterwards you can run `bundle exec guard` for Ruby or `yarn watch` for Javascript TDD.
I pefer to use this bash function for running single tests (must be run from the exercise directory):

```bash
alias etest() {
  if [ -f package.json ]
  then
    yarn test
  else
    ruby *_test.rb -c
  fi
}
```

To be able to submit and download new exercises you need to install `exercism`:

Mac:

```bash
brew update
brew install exercism
```
For other platforms: https://exercism.org/cli-walkthrough

After `exercism` is installed it must be configured to use your API token:

```bash
exercism configure --token=<your-api-token>
```
For additional assistance with the `exercism` CLI see: https://exercism.org/docs/using/solving-exercises/working-locally

<hr>

##### Note from exercism regarding licensing:

Our Content
All materials displayed on our Website and/or Platform are Copyright Exercism.

Where a resource does not appear to have a clear licensing statement, we would recommend that you check our GitHub source-code repositories. You should not assume that all content on our Platform is openly licensed, but it generally will be.

Community Content
All of the exercises delivered through the platform have been built by a community of volunteers and are licensed mainly under the MIT License. All of this content is available directly through our GitHub repositories (see https://github.com/exercism) where specific license details can be viewed.
