# Change Log
All notable changes to this project will be documented in this file. This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased](https://github.com/automatedinsightsinc/wordsmith-ruby-sdk/compare/v1.0.1...HEAD)

## [1.0.1](https://github.com/AutomatedInsightsInc/wordsmith-sdk/tree/v1.0.1) - 2016-04-27
##### Added
- Codeclimate test coverage reporter with dotenv for codeclimate token.
- Required ruby version in gemspec.

##### Changed
- Gem version number bumped (missed bump in 1.0.0 release)

## 1.0.0 - 2015-03-30

##### Added
- Enabled test converage for generating output since encoding has been fixed on the api.
- A place to put a test token in `test/test_helper.rb`, should be Robert's token to match actual projects to test against.

##### Changed
- Updated configuration default url to https://api.automatedinsights.com/v1
- Updated project generate output url to match routes in v1 api.

## 0.0.2 - 2015-02-02

##### Added
- Test coverage using minitest.
- Lots of README updates.
- CHANGELOG file.

##### Removed
- Rails dependencies.
- Configuration through yaml file.

##### Changed
- Configuration through conventional configuration methods.

## 0.0.1 - 2015-01-21
- Prototype requiring railties.