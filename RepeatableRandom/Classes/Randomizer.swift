import XCTest
import GameKit

public class Randomizer: NSObject {
    static var shared = Randomizer()
    var seed: UInt64 = 0

}

class RandomSeed: XCTestCase {
    @objc
    func replayingSeed() {
        recordSeed()
    }
    @objc
    func recordSeed() {
        let attachment = XCTAttachment(string: Randomizer.shared.seed.description)
        attachment.name = "shuffle with seed"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

extension Randomizer: XCTestObservation {
    public func testSuiteWillStart(_ testSuite: XCTestSuite) {
        var source: GKLinearCongruentialRandomSource
        var replay = false
        if let seedString = ProcessInfo().environment["seed"],
           let setSeed = UInt64(seedString) {
            source = .init(seed: setSeed)
            replay = true
        } else {
            source = .init()
        }
        seed = source.seed
        if testSuite.name == "All tests" {
            var allTests = testSuite.allTests
            let testSelector = replay ?
                #selector(RandomSeed.replayingSeed) :
                #selector(RandomSeed.recordSeed)
            let firstCase = RandomSeed(selector: testSelector)
            allTests = source.arrayByShufflingObjects(in: allTests) as! [XCTest]
            allTests.insert(firstCase, at: 0)
            testSuite.setValue(allTests, forKey: "tests")
        }
    }
}

extension XCTestSuite {
    var allTests: [XCTest] {
        tests.map {
            if let suite = $0 as? XCTestSuite {
                return suite.allTests
            } else {
                return [$0]
            }
        }.reduce([], +)
    }
}
