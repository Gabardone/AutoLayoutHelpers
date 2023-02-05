//
//  ActiveConstraint.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(Cocoa)
import Cocoa
#elseif canImport(UIKit)
import UIKit
#endif

/**
 Property wrapper for a single active constraint.

 This property wrapper facilitates swapping a single constraint for different layout configurations.

 There is no good way to enforce that a constraint isn't activated or deactivated anywhere else so it's best to
 keep use of this property wrapper to the `private` implementation of another type, usually a `NS/UIViewController` or
 `NS/UIView` subclass.
  */
@propertyWrapper
public struct ActiveConstraint {
    private var constraint: NSLayoutConstraint?

    public var wrappedValue: NSLayoutConstraint? {
        get {
            constraint
        }

        set {
            guard constraint != newValue else {
                return
            }

            constraint?.isActive = false
            constraint = newValue
            constraint?.isActive = true
        }
    }

    public init(constraint: NSLayoutConstraint? = nil) {
        self.constraint = constraint
        constraint?.isActive = true
    }
}
