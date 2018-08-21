import Foundation
import RxSwift

/*
	Why not just save the total as a property and modify that?
	Because you would have to ensure that the property was set
	before it goes out on the event stream (totalPointsObservable).
	Having the value encapsulated in the internal streams is safer
	and less-susceptible to accidental bugs.
*/

class SimpleCoreRxModel {
	private let disposeBag = DisposeBag()
	private let incrementSubject = PublishSubject<Void>()
	let totalPointsObservable: Observable<Int>
	
	init() {
		let valueSubject = BehaviorSubject<Int>(value: 0)
		totalPointsObservable = valueSubject //The subject is already of type Observable
		
		incrementSubject
			.withLatestFrom(valueSubject)
			.map { $0 + 1 }
			.subscribe(valueSubject)
			.disposed(by: disposeBag)
	}
	
	func incrementTotal() {
		incrementSubject.onNext(())
	}
}
