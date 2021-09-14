# RepeatableRandom

[![Example Tests](https://github.com/paulz/RepeatableRandom/actions/workflows/example-tests.yml/badge.svg)](https://github.com/paulz/RepeatableRandom/actions/workflows/example-tests.yml)

Since Xcode 10 version unit tests can be run in a random order. This helps to detect if order of the tests influence outcome. Unfortunately Xcode does not allow re-running tests with the same order to reproduce or debug detected test failures.

Now with RepeatableRandom tests run in a random order recording seed used for random generator in test artifacts. When tests fail, pass recorded seed as an environment variable and re-run tests with the same order. 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

1. Xcode
2. Unit Test target 

## Installation

RepeatableRandom is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile unit test target:

```ruby
pod 'RepeatableRandom',
    :git => 'https://github.com/paulz/RepeatableRandom/'
```

## Author

Paul Zabelin, paulz@users.noreply.github.com

## License

RepeatableRandom is available under the MIT license. See the LICENSE file for more info.
