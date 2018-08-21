import UIKit
import RxSwift

class SelectionViewController: UIViewController {
	private let selectionView = SelectionView()
	private let disposeBag = DisposeBag()
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		selectionView.exampleSelectedObserver.subscribe(onNext: handleExampleSelected).disposed(by: disposeBag)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = selectionView
	}
	
	private func handleExampleSelected(selectionOption: SelectionOption) {
		let viewController = self.viewController(forSelectionOption: selectionOption)
		navigationController?.pushViewController(viewController, animated: true)
	}
	
	private func viewController(forSelectionOption selectionOption: SelectionOption) -> UIViewController {
		switch selectionOption {
			case .simpleCoreRx:
				return SimpleCoreRxViewController()
		}
	}
}

