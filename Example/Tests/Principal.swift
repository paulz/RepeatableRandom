import XCTest
@testable import RepeatableRandom

class Principal: NSObject {
    let observers: [XCTestObservation] = [
        VerifyTestOrderObserver.shared,
        Randomizer.shared
    ]

    override init() {
        super.init()
        startObserving()
    }

    func startObserving() {
        observers.forEach {
            XCTestObservationCenter.shared.addTestObserver($0)
        }
    }
}
