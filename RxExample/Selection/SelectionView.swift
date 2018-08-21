import UIKit
import RxSwift

class SelectionView: UIView {
	private let tableView = UITableView()
	fileprivate let exampleSelectedSubject = PublishSubject<SelectionOption>()
	let exampleSelectedObserver: Observable<SelectionOption>

	override init(frame: CGRect) {
		exampleSelectedObserver = exampleSelectedSubject.asObservable()
		super.init(frame: frame)
		
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
		
		addSubview(tableView)
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func selectionOption(forRow row: Int) -> SelectionOption? {
		switch row {
			case 0:
				return SelectionOption.simpleCoreRx
			default:
				return nil
		}
	}
}

extension SelectionView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
		cell?.textLabel?.text = selectionOption(forRow: indexPath.row)?.rawValue
		return cell!
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return SelectionOption.count
	}
	
	private func text(forRow row: Int) -> String {
		switch row {
			case 0:
				return SelectionOption.simpleCoreRx.rawValue
			default:
				return ""
		}
	}
}

extension SelectionView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let selectionOption = selectionOption(forRow: indexPath.row) else {
			return
		}
		exampleSelectedSubject.onNext(selectionOption)
	}
}
