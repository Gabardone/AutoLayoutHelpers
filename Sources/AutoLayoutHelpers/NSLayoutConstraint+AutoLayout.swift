//
//  NSLayoutConstraint+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(Cocoa)
import Cocoa

public typealias XXLayoutPriority = NSLayoutConstraint.Priority
#elseif canImport(UIKit)
import UIKit

public typealias XXLayoutPriority = UILayoutPriority
#endif

public extension NSLayoutConstraint {
    /**
     Activates the calling constraint.

     Unlike calling `isActive = true`, this call returns `self` so it can be chained or sent as a parameter.
     - Returns: `self`
     */
    @discardableResult @inlinable
    func activate() -> Self {
        isActive = true
        return self
    }

    /**
     Deactivates the calling constraint.

     Unlike calling `isActive = false`, this call returns `self` so it can be chained or sent as a parameter.
     - Returns: `self`
     */
    @discardableResult @inlinable
    func deactivate() -> Self {
        isActive = false
        return self
    }

    /**
     Sets the priority of the calling constraint.

     Keep in mind the documented rules for when a constraint's priority can be changed (in particular do not change a
     constraint's priority to/from `.required` while it is active).

     The method returns `self` so it can be chained with other operations. I.e.
     `myConstraint.priority(.defaultHigh).activate()`
     - Parameter priority: The new priority for the calling layout constraint.
     - Returns: `self`
     */
    @discardableResult @inlinable
    func priority(_ priority: XXLayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}
