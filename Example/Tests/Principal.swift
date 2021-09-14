import XCTest

class Principal: NSObject {
    let observers: [XCTestObservation] = [
        VerifyTestOrderObserver.shared
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
