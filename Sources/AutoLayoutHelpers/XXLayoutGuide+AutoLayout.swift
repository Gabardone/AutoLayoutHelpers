//
//  XXLayoutGuide+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(Cocoa)
import Cocoa

extension NSLayoutGuide: LayoutArea {}
typealias XXLayoutGuide = NSLayoutGuide
#elseif canImport(UIKit)
import UIKit

extension UILayoutGuide: LayoutArea {}
typealias XXLayoutGuide = UILayoutGuide

extension UILayoutGuide {
    /// Wrapper for equal API on iOS/macOS
    @inlinable
    var frame: CGRect {
        layoutFrame
    }
}
#endif
