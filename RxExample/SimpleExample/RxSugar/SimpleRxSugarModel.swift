import Foundation
import RxSwift
import RxSugar

/*
	Conforming to RXSObject provides an rxs extension and with it, a dispose bag.
	This allows for a more concise syntax to handle subscriptions.
	The ++ operator adds the subscription to the dispose bag.
	The <~ operator subscribes the observer to the observable.
	The syntax also makes it's easier to see which direction it is flowing.
		++ observer <~ observable
				<----- flow of data
	In core Rx the subscribe syntax makes the direction counter-intuitive.
		observable.subscribe(observer)
	To me, it sounds like the observable is subscribing to the observer.
*/

class SimpleRxSugarModel: RXSObject {
	private let incrementSubject = PublishSubject<Void>()
	let totalPointsObservable: Observable<Int>
	
	init() {
		let valueSubject = BehaviorSubject<Int>(value: 0)
		totalPointsObservable = valueSubject
		
		rxs.disposeBag
			++ valueSubject <~ incrementSubject.withLatestFrom(valueSubject).map { $0 + 1 }
	}
	
	func incrementTotal() {
		incrementSubject.onNext(())
	}
}
