/*:
	# RxSwift and RxSugar Examples

	This project is broken up into examples.
	The first example (Simple) is a button that increments a total.
	It is broken up further comparing the same functionality but implemented differently.
	The SimpleCoreRx example shows how this can be accomplished by only using core RxSwift.
	The SimpleRxSugar example show the same example but using RxSwift for a more convenient and readable syntax.

	You can find the RxSugar repo here: [https://github.com/RxSugar/RxSugar]
*/


/*:
	# Project Architecture

	There is a blog explaining the reasoning behind the architecture that is being used.
	Read about it here: [http://blog.asynchrony.com/2016/02/model-view-binding-swift/](Model-View-Binding in Swift)
	The example project is a little outdated as the Variable type has been deprecated in favor of BehaviorSubject.
	I will be working on a pull request to update it.
	TLDR: Pull out the binding logic from the view controller to leave the view controller to do what view controllers do: lifecycle and navigation.  The presenter can also be tested if desired.  Testing view controllers usually requires that they run through their lifecycle events artificially which degrades the validity of those tests.  Any logic that can be extracted from the view controller makes it more reliably testable. 
*/
