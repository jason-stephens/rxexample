import Foundation
import RxSwift

class SimpleCoreRxModel {
	private var totalPoints = 0
	private let totalPointsSubject = PublishSubject<Int>()
	let totalPointsObservable: Observable<Int>
	
	init() {
		totalPointsObservable = totalPointsSubject.asObservable().startWith(totalPoints)
	}
	
	func incrementTotal() {
		totalPoints += 1
		totalPointsSubject.onNext(totalPoints)
	}
}
