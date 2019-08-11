//
//  RelayWrappers.swift
//  RxPropertyWrappers
//
//  Created by Alex Manarpies on 11/08/2019.
//  Copyright © 2019 Jarroo. All rights reserved.
//

import RxRelay
import RxSwift

@propertyWrapper
public struct BehaviorRelayWrapping<T> {
    private let subject: BehaviorRelay<T>
    
    // MARK: PropertyWrapper
    
    public let wrappedValue: Observable<T>
    
    public init(value: T) {
        subject = BehaviorRelay(value: value)
        wrappedValue = subject.asObservable()
    }
    
    // MARK: BehaviorRelay
    
    public func accept(_ event: T) {
        subject.accept(event)
    }
}

@propertyWrapper
public struct PublishRelayWrapping<T> {
    private let subject: PublishRelay<T>
    
    // MARK: PropertyWrapper
    
    public let wrappedValue: Observable<T>
    
    public init() {
        subject = PublishRelay<T>()
        wrappedValue = subject.asObservable()
    }
    
    // MARK: PublishRelay
    
    public func accept(_ event: T) {
        subject.accept(event)
    }
}

