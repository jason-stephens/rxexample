import UIKit
import RxSwift

/*
	NOTE: If RxCocoa were used, the creation of the Observable would be simpler.
	RxCocoa allows the observable to be pulled from the button tap:
		buttonTappedObservable = button.rx.tap.asObservable()
	It also eliminates the code for the addTarget() call on the button
	as well as the selector that it points to.
	The PublishSubject would also not be necessary.
*/

class SimpleCoreRxView: UIView {
	private let label = UILabel()
	private let button = defaultButton()
	private let buttonTappedSubject = PublishSubject<Void>()
	let buttonTappedObservable: Observable<Void>
	
	override init(frame: CGRect) {
		buttonTappedObservable = buttonTappedSubject.asObservable()
		super.init(frame: frame)
		
		backgroundColor = .white
		
		label.text = "something"
		label.textAlignment = .center
		
		button.setTitle("Increment", for: .normal)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		
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
	
	@objc
	private func buttonTapped(sender: UIButton) {
		buttonTappedSubject.onNext(())
	}
}

private func defaultButton() -> UIButton {
	let button = UIButton()
	button.setTitleColor(.white, for: .normal)
	button.backgroundColor = .darkGray
	return button
}
