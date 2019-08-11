//
//  SubjectWrapper.swift
//  RxPropertyWrappers
//
//  Created by Alex Manarpies on 11/08/2019.
//  Copyright © 2019 Jarroo. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

@propertyWrapper
public struct BehaviorSubjectWrapping<T>: ObserverType {
    private let subject: BehaviorSubject<T>
    
    // MARK: PropertyWrapper
    
    public let wrappedValue: Observable<T>
    
    public init(value: T) {
        subject = BehaviorSubject(value: value)
        wrappedValue = subject.asObservable()
    }
    
    // MARK: ObserverType
    
    public func on(_ event: Event<T>) {
        subject.on(event)
    }
}

@propertyWrapper
public struct PublishSubjectWrapping<T>: ObserverType {
    private let subject: PublishSubject<T>
    
    // MARK: PropertyWrapper
    
    public let wrappedValue: Observable<T>
    
    public init() {
        subject = PublishSubject<T>()
        wrappedValue = subject.asObservable()
    }
    
    // MARK: ObserverType
    
    public func on(_ event: Event<T>) {
        subject.on(event)
    }
}
