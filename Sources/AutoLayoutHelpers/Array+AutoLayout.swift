//
//  Array+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(Cocoa)
import Cocoa
#elseif canImport(UIKit)
import UIKit
#endif

public extension [NSLayoutConstraint] {
    /**
     Use this method for a more terse activation of an `Array` of layout constraints.

     It also returns `self` so it can be further chained or sent as a parameter to other methods.
     */
    @discardableResult @inlinable
    func activate() -> Self {
        NSLayoutConstraint.activate(self)
        return self
    }

    /**
     Use this method for a more terse deactivation of an `Array` of layout constraints.

     It also returns `self` so it can be further chained or sent as a parameter to other methods.
     */
    @discardableResult @inlinable
    func deactivate() -> Self {
        NSLayoutConstraint.deactivate(self)
        return self
    }
}
