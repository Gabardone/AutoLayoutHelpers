//
//  UIView+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    /**
     Use instead of `insertSubview(_:at:)` to insert a subview in the caller's subview array at the specified index.

     Management of the `translatesAutoresizingMaskIntoConstraints` flag is responsibility of its `superview`, so it
     makes the most sense to turn it off upon insertion to a view hierarchy. Other than that this method works the exact
     same as `insertSubview(_:at:)`

     The method uses a short, nonspecific name as it's meant to be the default one to use, plus `insertArrangedSubview`
     was already taken.
     - Parameter subview: The view to add at the end of the subview array, to be laid out using AutoLayout.
     - Parameter index: The index within the subview array where `subview` will end. See the relevant documentation for
     `UIView.insertSubview(_:at:)` for more information.
     - Note: For standardized AutoLayout usage it's best to declare a linter rule that triggers whenever `addSubview` is
     used. The few cases where fully manual layout is warranted can turn the rule off.
     */
    func insert(subview: UIView, at index: Int) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(subview, at: index)
    }

    /**
     Use instead of `insertSubview(_:aboveSubview:)` to insert a subview in the caller's subview array at the
     specified position.

     Management of the `translatesAutoresizingMaskIntoConstraints` flag is responsibility of its `superview`, so it
     makes the most sense to turn it off upon insertion to a view hierarchy. Other than that this method works the exact
     same as `insertSubview(_:aboveSubview:)`

     The method uses a short, nonspecific name as it's meant to be the default one to use, plus `insertArrangedSubview`
     was already taken.
     - Parameter subview: The view to insert at the specified position in the subview array, to be laid out using
     AutoLayout.
     - Parameter aboveSubview: Existing subview above which `subview` should be inserted. Check the documentation of
     `UIView.insertSubview(_:aboveSubview:)` for more information.
     - Note: For standardized AutoLayout usage it's best to declare a linter rule that triggers whenever `insertSubview`
     is used. The few cases where fully manual layout is warranted can turn the rule off.
     */
    func insert(subview: UIView, aboveSubview siblingSubview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(subview, aboveSubview: siblingSubview)
    }

    /**
     Use instead of `insertSubview(_:belowSubview:)` to insert a subview in the caller's subview array at the
     specified position.

     Management of the `translatesAutoresizingMaskIntoConstraints` flag is responsibility of its `superview`, so it
     makes the most sense to turn it off upon insertion to a view hierarchy. Other than that this method works the exact
     same as `insertSubview(_:belowSubview:)`

     The method uses a short, nonspecific name as it's meant to be the default one to use, plus `insertArrangedSubview`
     was already taken.
     - Parameter subview: The view to insert at the specified position in the subview array, to be laid out using
     AutoLayout.
     - Parameter belowSubview: Existing subview below which `subview` should be inserted. Check the documentation of
     `UIView.insertSubview(_:belowSubview:)` for more information.
     - Note: For standardized AutoLayout usage it's best to declare a linter rule that triggers whenever `insertSubview`
     is used. The few cases where fully manual layout is warranted can turn the rule off.
     */
    func insert(subview: UIView, belowSubview siblingSubview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(subview, belowSubview: siblingSubview)
    }
}

/**
 Typealias for declaration of cross-platform utilities that require different platform types.
 */
public typealias XXView = UIView
#endif
