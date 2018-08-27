/*:
	# Why Rx?
	Observable vs delegate
	Data does not get out of sync
	Pushes architecture to be immutable?
*/

/*:
	Publish_ vs Behavior_ vs Replay_ vs Async_
	In Rx, there are many prefixes to types such as Subject but what do they mean?
	- Publish only emits values and event is received when subscribing.
	- Behavior has to start with a value and a Next event is emitted to the subscriber when subscribed to.
	- Replay gives the whole history as Next events when subscribed to.
	- Async emits the last value only after it completes.

	The Subject offers a lot of functionality in Rx.  It is an observable but it can also observe.  This gives us a nice way internally in our class to take a stream taking data (observer), modify it, and send it back out (observable).
	--->---- (observer)
	                  |
				manipulate data
	                  |
	---<-- (observable)
	While you can expose the subject as a property as a way to interact with the object, a better practice would be to only expose the observables/observers that are needed to interact with the object to keep the implementation private.  It also makes it clearer how the object should be used.
*/

/*:
	# Operators
	Operators give us a way to manipulate the stream.  We can manipulate data, flow, timing, etc.  The operators are generally consistent across all implementations of Rx.
	http://rxmarbles.com and the RxMarbles app allows you to view and manipulate operators to see how it affects the stream.  Tha app seems to have more operators in its list.
*/

/*:
	# Flatmap and FlatmapLatest
	These two operators are very useful but can be tricky to wrap your head around.  The easiest way to explain is by example.
	Take the case where you want to autocomplete something as the user types.  The text that is entered is sent via stream to a service call to get the list of matches.  Flatmap allows us to take the stream that has the text change events, call the service, and output the result on another stream.  The problem in this case is that the user can type quickly - faster than our service can return results.  That'll potentially cause the results to come back slow and possibly out of order.  FlatmapLatest effectively cancels any pending events and only takes the latest event from the input stream (text changes).
	These operators can also be used to chain a sequence of network calls.
*/

