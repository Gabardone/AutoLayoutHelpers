//
//  NSView+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if os(macOS)
import Cocoa

public extension NSView {
    /**
     Use instead of `addSubview(_:positioned:relativeTo:)` to add a subview to the caller's subview array at the
     specified position.

     Management of the `translatesAutoresizingMaskIntoConstraints` flag is responsibility of its `superview`, so it
     makes the most sense to turn it off upon insertion to a view hierarchy. Other than that this method works the exact
     same as `addSubview(_:positioned:relativeTo:)`

     The method uses a short, nonspecific name as it's meant to be the default one to use, plus `insertArrangedSubview`
     was already taken.
     - Parameter subview: The view to add at the end of the subview array, to be laid out using AutoLayout.
     - Parameter place: Ordering of the subview relative to `otherView`. See the relevant documentation for
     `NSView.addSubview(_:positioned:relativeTo:)` for more information.
     - Parameter otherView: Existing subview relative to which `subview` will be inserted. If nil, the subview will
     be inserted at the top or bottom depending on the value of `place`. See the relevant documentation for
     `NSView.addSubview(_:positioned:relativeTo:)` for more information.
     - Note: For standardized AutoLayout usage it's best to declare a linter rule that triggers whenever `addSubview` is
     used. The few cases where fully manual layout is warranted can turn the rule off.
     */
    @inlinable
    func add(subview: XXView, positioned place: NSWindow.OrderingMode, relativeTo otherView: XXView?) {
        subview.translatesAutoresizingMaskIntoConstraints = false // swiftlint:disable:this avoid_manually_disabling_TARMiC line_length
        addSubview(subview, positioned: place, relativeTo: otherView) // swiftlint:disable:this avoid_addsubview
    }

    /**
     Wrapper for `layoutSubtreeIfNeeded` to use the UIKit name.

     In this case the UIKit name is less confusing, although the methods don't act exactly the same on either
     platforms. The differences, hoaever, seem to be only noticeable in contrived scenarios.
     */
    @inlinable
    func layoutIfNeeded() {
        layoutSubtreeIfNeeded()
    }
}

/**
 Typealias for declaration of cross-platform utilities that require different platform types.
 */
public typealias XXView = NSView
#endif
