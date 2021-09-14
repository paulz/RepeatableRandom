import XCTest
import RepeatableRandom

class Principal: NSObject {
    let observers: [XCTestObservation] = [
        VerifyTestOrderObserver.shared,
        TestsOrderRandomizer.shared
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
