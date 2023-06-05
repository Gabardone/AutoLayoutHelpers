//
//  XXView+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public extension XXView {
    /**
     Use instead of `addSubview(_:)` to add a subview to the caller's subview array.

     Management of the `translatesAutoresizingMaskIntoConstraints` flag is responsibility of its `superview`, so it
     makes the most sense to turn it off upon insertion to a view hierarchy. Other than that this method works the exact
     same as `addSubview(_:)`

     The method uses a short, nonspecific name as it's meant to be the default one to use, plus `addArrangedSubview` was
     already taken.
     - Parameter subview: The view to add at the end of the subview array, to be laid out using AutoLayout.
     - Note: For standardized AutoLayout usage it's best to declare a linter rule that triggers whenever `addSubview` is
     used. The few cases where fully manual layout is warranted can turn the rule off.
     */
    func add(subview: XXView) {
        subview.translatesAutoresizingMaskIntoConstraints = false // swiftlint:disable:this avoid_manually_disabling_TARMiC
        addSubview(subview) // swiftlint:disable:this avoid_addsubview
    }
}

/**
 NSView implements the `LayoutArea` protocol, but it still needs declaring in Swift.
 */
extension XXView: LayoutArea {}

public extension XXView {
    /**
     Constraint generator for a view against its superview edges.

     The method will return an array of the constraints between the calling view and its superview edges with an
     inset equal to that specified in the given directional edge insets.

     For height/width constraints against superview, just use the regular width/height constraint anchor API.
     - Precondition: The calling view must have a superview.
     - Parameter edges: The edges against which we want to snap our view to its superview. By default the method
     generates constraints in all directions.
     - Parameter insets: The inset between the superview and the calling view to be applied in the returned
     constraints. Only the ones called for in the `edges` parameters will be used. By default on insets are applied.
     - Returns: An array with the generated constraints.
     */
    func constraintsAgainstSuperviewEdges(
        _ edges: NSDirectionalRectEdge = .all,
        insets: NSDirectionalEdgeInsets = .zero
    ) -> [NSLayoutConstraint] {
        guard let superview else {
            preconditionFailure("Attempted to create constraints against superview with no superview set.")
        }

        return constraintsAgainstEnclosing(layoutArea: superview, edges: edges, insets: insets)
    }

    /**
     Constraint generator for a view against its superview edges.

     The method will return an array of the constraints between the calling view and its superview edges with an
     inset equal to the given inset for each set of rect edges.
     - Precondition: The calling view must have a superview.
     - Parameter insetEdges: A list of pairings of an inset value with a rect edge set. The method does no validation
     so if any of the rect edge sets overlap you'll get overlapping constraints as well.
     - Returns: An array with the generated constraints.
     */
    func constraintsAgainstSuperviewInsetEdges(
        _ insetEdges: (CGFloat, NSDirectionalRectEdge)...
    ) -> [NSLayoutConstraint] {
        guard let superview else {
            preconditionFailure("Attempted to create constraints against superview with no superview set.")
        }

        return constraintsAgainstEnclosing(layoutArea: superview, insetEdges: insetEdges)
    }

    /**
     Constraint generator to center a view within its superview.

     The returned constraints when activated will keep the caller centered within its superview.
     - Precondition: The calling view must have a superview.
     - Parameter offsets: Optional offsets to apply to the returned constraints. Default to zero.
     - Returns: An array with the generated constraints.
     */
    func constraintsCenteringInSuperview(
        horizontalOffset: CGFloat = 0.0,
        verticalOffset: CGFloat = 0.0
    ) -> [NSLayoutConstraint] {
        guard let superview else {
            preconditionFailure("Attempted to create constraints against superview with no superview set.")
        }

        return constraintsCenteringIn(
            layoutArea: superview,
            horizontalOffset: horizontalOffset,
            verticalOffset: verticalOffset
        )
    }
}
