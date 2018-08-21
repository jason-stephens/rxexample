@testable import RxExample
import XCTest
import RxSwift
import RxTest

class SimpleCoreRxModelTests: XCTestCase {
	private var disposeBag: DisposeBag!
	private var testObject: SimpleCoreRxModel!
	private var testScheduler: TestScheduler!
	private var observer: TestableObserver<Int>!
		
	override func setUp() {
		super.setUp()
		disposeBag = DisposeBag()
		testObject = SimpleCoreRxModel()
		testScheduler = TestScheduler(initialClock: 0)
		observer = testScheduler.createObserver(Int.self)
	}
	
	func testTotalStartsAtZero() {
		testObject.totalPointsObservable.subscribe(observer).disposed(by: disposeBag)
		
		XCTAssertEqual(observer.events, [next(0, 0)])
	}
	
	func testIncrementTotalEventsNewCorrectTotal() {
		testObject.totalPointsObservable.subscribe(observer).disposed(by: disposeBag)
		
		testObject.incrementTotal()
		testObject.incrementTotal()

		XCTAssertEqual(observer.events, [next(0, 0), next(0, 1), next(0, 2)])
	}
}
