import UIKit

class SimpleRxSugarViewController: UIViewController {
	private let presenter = SimpleRxSugarPresenter()
	private let model = SimpleRxSugarModel()
	
	override func loadView() {
		title = "Simple RxSugar Example"
		let simpleView = SimpleRxSugarView()
		view = simpleView
		presenter.bind(view: simpleView, model: model)
	}
}

