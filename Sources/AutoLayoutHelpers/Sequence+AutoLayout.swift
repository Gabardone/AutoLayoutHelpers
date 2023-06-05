//
//  Sequence+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public extension Sequence<NSLayoutConstraint> {
    /**
     Use this method for a more terse activation of a non-array sequence of layout constraints.
     */
    @inlinable
    func activate() {
        // Actually building up the array instead of iterating as activating all at once is more performant for the
        // layout engine.
        Array(self).activate()
    }

    /**
     Use this method for a more terse deactivation of a non-array sequence of layout constraints.
     */
    @inlinable
    func deactivate() {
        // Actually building up the array instead of iterating as activating all at once is more performant for the
        // layout engine.
        Array(self).deactivate()
    }

    /**
     Sets the priority of all the constraints in the sequence to the given one.

     Priority changes obey the same rules as if done individually, so avoid changing from/to `.required` priority for
     active constraints.
     - Parameter priority: The new priority for all the constraints in the array.
     - Returns: `self`, so it can be used as one of a series of chained calls.
     */
    @discardableResult @inlinable
    func priority(_ priority: XXLayoutPriority) -> Self {
        for constraint in self {
            constraint.priority = priority
        }

        return self
    }
}
