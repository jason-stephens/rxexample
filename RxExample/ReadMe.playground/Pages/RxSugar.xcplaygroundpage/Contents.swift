/*:
	# Notes on RxSugar

	RxSugar adds a few things to RxSwift.
	The first is a simplified subscribe syntax.  While it does add custom operators and isn't obvious on the outset what it does, it isn't complicated and makes the logic easier to follow long-term.

	Any object conforming to the RXSObject protocol gets an rxs extension and with it, a dispose bag.
	This allows for a more concise syntax to handle subscriptions:

	rxs.disposeBag
	++ observer1 <~ observable1
	++ observer2 <~ observable2

	The ++ operator adds the subscription to the dispose bag.
	The <~ operator subscribes the observer to the observable.
	The syntax also makes it's easier to see which direction it is flowing.

	++ observer <~ observable
	<----- flow of data

	In core Rx the subscribe syntax makes the direction counter-intuitive.

	observable.subscribe(observer)
	flow of data -----> 

	To me, it sounds like the observable is subscribing to the observer.

	------------------
	It also provides an extension (rxs) for subscribing to UIKit control events.  If a button is tapped, text is changed, etc. it can be subscribed to.  This is similar to the way that RxCocoa uses the 'rx' extension for those events mainly because RxSugar came up with it and RxCocoa liked the pattern and borrowed it. ¯\_(ツ)_/¯

	Custom extensions can also be added to 
*/

