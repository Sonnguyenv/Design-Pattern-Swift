//
//  MulticastDelegate.swift
//  DesignPattern
//
//  Created by SonNV MacMini on 18/08/2022.
//

import Foundation

class MulticastDelegate<T> {
    // MARK: We create a Wrapper class to wrap each delegate and hold a weak reference to it. This is done in order to prevent retain cycles.
    private class Wrapper {
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    // MARK: We make an array of Wrapper objects private. Meanwhile the “real” delegates property is created to have an array containing non-nil values.
    private var wrappers: [Wrapper] = []
    public var delegates: [T] {
        return wrappers
            .compactMap{ $0.delegate } as! [T]
    }
    
    // MARK: We use the add(delegate: T) method to add a new delegate to the array.
    public func add(delegate: T) {
        let wrapper = Wrapper(delegate as AnyObject)
        wrappers.append(wrapper)
    }
    
    // MARK: Similarly, by using the remove(delegate: T) method, we remove a delegate.
    public func remove(delegate: T) {
        guard let index = wrappers.firstIndex(where: {
            $0.delegate === (delegate as AnyObject)
        }) else {
            return
        }
        wrappers.remove(at: index)
    }
    
    // MARK: The invokeForEachDelegate(_ handler: (T) -> ()) will be called when we need to notify each delegate about an event.
    public func invokeForEachDelegate(_ handler: (T) -> ()) {
        delegates.forEach { handler($0) }
    }
}
