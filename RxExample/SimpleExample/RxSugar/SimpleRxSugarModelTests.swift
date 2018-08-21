@testable import RxExample
import XCTest
import RxSwift
import RxTest
import RxSugar

class SimpleRxSugarModelTests: XCTestCase {
	private var disposeBag: DisposeBag!
	private var testObject: SimpleRxSugarModel!
	private var testScheduler: TestScheduler!
	private var observer: TestableObserver<Int>!
	
	override func setUp() {
		super.setUp()
		disposeBag = DisposeBag()
		testObject = SimpleRxSugarModel()
		testScheduler = TestScheduler(initialClock: 0)
		observer = testScheduler.createObserver(Int.self)
	}
	
	func testTotalStartsAtZero() {
		rxs.disposeBag
			++ observer <~ testObject.totalPointsObservable
		
		XCTAssertEqual(observer.events, [next(0, 0)])
	}
	
	func testIncrementTotalEventsNewCorrectTotal() {
		rxs.disposeBag
			++ observer <~ testObject.totalPointsObservable
		
		testObject.incrementTotal()
		testObject.incrementTotal()
		
		XCTAssertEqual(observer.events, [next(0, 0), next(0, 1), next(0, 2)])
	}
}
