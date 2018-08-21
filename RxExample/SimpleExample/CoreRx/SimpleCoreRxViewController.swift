import UIKit

class SimpleCoreRxViewController: UIViewController {
	private let presenter = SimpleCoreRxPresenter()
	private let model = SimpleCoreRxModel()

	override func loadView() {
		title = "Simple Core Rx Example"
		let simpleView = SimpleCoreRxView()
		view = simpleView
		presenter.bind(view: simpleView, model: model)
	}
}
