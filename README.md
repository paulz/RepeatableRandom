# RepeatableRandom

[![Example Tests](https://github.com/paulz/RepeatableRandom/actions/workflows/example-tests.yml/badge.svg)](https://github.com/paulz/RepeatableRandom/actions/workflows/example-tests.yml)

Since Xcode 10 version unit tests can be run in a random order. This helps to detect if order of the tests influence outcome. Unfortunately Xcode does not allow re-running tests with the same order to reproduce or debug detected test failures.

Now with RepeatableRandom tests run in a random order recording seed used for random generator in test artifacts. 
<img width="867" alt="Test Report showing recorded seed" src="https://user-images.githubusercontent.com/59230/133321684-ce7fb74a-4011-4d1f-ac67-6e8951239cac.png">

When tests fail, pass recorded seed as an environment variable and re-run tests with the same order. 
<img width="919" alt="Fixed seed passed as environment to test run" src="https://user-images.githubusercontent.com/59230/133321690-ed469c4f-1f64-443d-88a6-44c3a32dba96.png">

<img width="871" alt="Test Report showing re-run with fixed seed" src="https://user-images.githubusercontent.com/59230/133321688-2f41fd0b-df56-4d40-86f0-0fe26a8a3c71.png">


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

And add `TestsOrderRandomizer.shared` as a test observer:

```swift
import RepeatableRandom

XCTestObservationCenter.shared
   .addTestObserver(TestsOrderRandomizer.shared)
```

## Author

Paul Zabelin, paulz@users.noreply.github.com

## License

RepeatableRandom is available under the MIT license. See the LICENSE file for more info.
