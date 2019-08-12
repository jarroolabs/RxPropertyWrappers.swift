# RxPropertyWrappers.swift
Swift 5.1 Property Wrappers for RxSwift that allow you to expose non-mutable `Observable` types publicly, 
while wrapping them internally with mutable `Subject`s or `Relay`s.

## Examples

### Subject wrappers

```swift
class SomeViewModel {
  
    @BehaviorSubjectWrapping(value: 0)
    var count: Observable<Int> // Type annotation is actually optional in this case
    
    @PublishSubjectWrapping
    var errors: Observable<String>
    
    func operation() {
      _count.onNext(1)
      _errors.onNext(SomeError.fail)
    }
}

enum SomeError {
  case fail
}
```

### Relay wrappers

```swift
class SomeViewModel {
  
    @BehaviorRelayWrapping(value: 0)
    var count: Observable<Int> // Type annotation is actually optional in this case
    
    @PublishRelayWrapping
    var errors: Observable<String>
    
    func operation() {
      _count.accept(1)
      _errors.accept(SomeError.fail)
    }
}

enum SomeError {
  case fail
}
```

## Installation

For now, feel free to copy-paste from the [Sources](https://github.com/jarroolabs/RxPropertyWrappers.swift/tree/master/RxPropertyWrappers/Sources) 
directory :).
