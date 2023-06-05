//
//  ActiveConstraints.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

/**
 Property wrapper for a collection of active constraints.

 Intended for a collection of constraints that need to be replaced at once. It will make sure anything it stores is
 kept active, and any outgoing collection of constraints will be deactivated on its way out.

 Since there is no good way to enforce that the constraints aren't being activated or deactivated elsewhere, most of the
 time this is intended for use as `private var` properties within the implementation of a `NS/UIViewController` or
 `NS/UIView` subclass.
  - Note: It may be worth exploring using `Set<NSLayoutConstraint>` instead, although the impedance between the
 existing APIs and the Swift language and the `Set` type may make it less ergonomic or proficient to use. The issues
 that may come from using an `Array` instead of `Set` are not major either since an identical constraint applied twice
 shouldn't change the results of the layout engine's work.
 */
@propertyWrapper
public struct ActiveConstraints {
    private var constraints: [NSLayoutConstraint]

    public var wrappedValue: [NSLayoutConstraint] {
        get {
            constraints
        }

        set {
            guard constraints != newValue else {
                return
            }

            constraints.deactivate()
            constraints = newValue
            constraints.activate()
        }
    }

    /**
     Default initializer has an empty array as a default input parameter since most of the time we'll start empty.
     */
    public init(constraints: [NSLayoutConstraint] = []) {
        self.constraints = constraints
        constraints.activate()
    }
}
