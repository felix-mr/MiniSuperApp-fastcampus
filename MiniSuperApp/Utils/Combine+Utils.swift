//
//  Combine+Utils.swift
//  MiniSuperApp
//
//  Created by Felix.mr on 2022/03/01.
//

import Combine
import CombineExt
import Foundation
import Metal

public class ReadOnlyCurrentValuePublisher<Element>: Publisher {
  public typealias Output = Element
  public typealias Failure = Never
  
  public var value: Element {
    return currentValueRelay.value
  }
  
  fileprivate let currentValueRelay: CurrentValueRelay<Output>
  
  init(_ initialValue: Element) {
    self.currentValueRelay = CurrentValueRelay(initialValue)
  }
  
  public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Element == S.Input {
    currentValueRelay.receive(subscriber: subscriber)
  }
}

public final class CurrentValuePublisher<Element>: ReadOnlyCurrentValuePublisher<Element> {
  typealias Output = Element
  typealias Failure = Never
  
  public override init(_ initialValue: Element) {
    super.init(initialValue)
  }
  
  public func send(_ value: Element) {
    currentValueRelay.accept(value)
  }
}
