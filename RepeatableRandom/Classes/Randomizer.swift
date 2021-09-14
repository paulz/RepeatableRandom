import XCTest
import GameKit

public class TestsOrderRandomizer: NSObject {
    public static var shared = TestsOrderRandomizer()
    var seed: UInt64 = 0
}

class RandomSeed: XCTestCase {
    private func addSeedToArtifacts() {
        let attachment = XCTAttachment(string: TestsOrderRandomizer.shared.seed.description)
        attachment.name = "shuffle with seed \(TestsOrderRandomizer.shared.seed)"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    @objc func replayingSeed() {
        addSeedToArtifacts()
    }
    @objc func recordSeed() {
        addSeedToArtifacts()
    }
}

extension TestsOrderRandomizer: XCTestObservation {
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

private extension XCTestSuite {
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
