//
//  RxPropertyWrappersTests.swift
//  RxPropertyWrappersTests
//
//  Created by Alex Manarpies on 11/08/2019.
//  Copyright © 2019 Jarroo. All rights reserved.
//

import XCTest
import RxSwift
import RxPropertyWrappers

class RxPropertyWrappersTests: XCTestCase {

    func testWrappers() {
        // TODO
    }
}

struct ObjectWithWrappers {
    private let disposeBag = DisposeBag()
    
    @BehaviorSubjectWrapping(value: "Initial String Value")
    var behaviorSubject: Observable
    
    @PublishSubjectWrapping
    var publishSubject: Observable<String>
    
    @BehaviorRelayWrapping(value: "Initial String Value")
    var behaviorRelay: Observable<String>
    
    @PublishRelayWrapping
    var publishRelay: Observable<String>
    
    func subjects() {
        behaviorSubject
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)
        
        publishSubject
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)

        _behaviorSubject.onNext("Test")
        _publishSubject.onNext("Test")
    }
    
    func relays() {
        behaviorRelay
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)
        
        publishRelay
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)

        _behaviorRelay.accept("Test")
        _publishRelay.accept("Test")
    }
}
