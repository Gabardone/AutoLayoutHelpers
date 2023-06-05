//
//  NSDirectionalRectEdge+AutoLayout.swift
//  
//
//  Created by Óscar Morales Vivó on 2/27/23.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public extension NSDirectionalRectEdge {
    /// Rect edges in both horizontal directions.
    static let horizontal: NSDirectionalRectEdge = [.leading, .trailing]

    /// Rect edges in both vertical directions.
    static let vertical: NSDirectionalRectEdge = [.top, .bottom]
}
