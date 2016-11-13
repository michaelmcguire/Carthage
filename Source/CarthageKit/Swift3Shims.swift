import Foundation
import Result
import ReactiveCocoa
import ReactiveTask

#if swift(>=3)
#else
	// MARK: - Result

	internal extension Result {
		static func success(value: Value) -> Result<Value, Error> {
			return .Success(value)
		}

		static func failure(error: Error) -> Result<Value, Error> {
			return .Failure(error)
		}
	}

	// MARK: - ReactiveTask

	internal extension TaskEvent {
		static func success(value: T) -> TaskEvent<T> {
			return .Success(value)
		}
	}

	internal extension Task {
		func launch(standardInput standardInput: SignalProducer<NSData, NoError>? = nil) -> SignalProducer<TaskEvent<NSData>, TaskError> {
			return launchTask(self, standardInput: standardInput)
		}
	}
#endif
