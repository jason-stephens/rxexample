import Foundation
import RxSwift

struct SimpleCoreRxPresenter {
	private let disposeBag = DisposeBag()
	func bind(view: SimpleCoreRxView, model: SimpleCoreRxModel) {
		view.incrementRequestedObservable.subscribe(onNext: model.incrementTotal).disposed(by: disposeBag)
		model.totalPointsObservable.subscribe(onNext: view.update(totalPoints:)).disposed(by: disposeBag)
	}
}
