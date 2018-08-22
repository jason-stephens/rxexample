import Foundation
import RxSwift
import RxSugar

struct SimpleRxSugarPresenter {
	func bind(view: SimpleRxSugarView, model: SimpleRxSugarModel) {
		view.rxs.disposeBag
			++ model.incrementTotal <~ view.incrementRequestedObservable
			++ view.update(totalPoints:) <~ model.totalPointsObservable
	}
}
