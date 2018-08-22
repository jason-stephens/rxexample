import UIKit
import RxSwift
import RxSugar

class SimpleRxSugarView: UIView {
	private let label = UILabel()
	private let button = defaultButton()
	let incrementRequestedObservable: Observable<Void>
	
	override init(frame: CGRect) {
		incrementRequestedObservable = button.rxs.tap
		super.init(frame: frame)
		
		backgroundColor = .white
		
		label.text = "something"
		label.textAlignment = .center
		
		button.setTitle("Increment", for: .normal)
		
		addSubview(label)
		addSubview(button)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
		button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		button.widthAnchor.constraint(equalToConstant: 120).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func update(totalPoints: Int) {
		label.text = "Total Points: \(totalPoints)"
	}
}
