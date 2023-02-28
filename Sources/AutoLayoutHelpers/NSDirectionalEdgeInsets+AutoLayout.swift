//
//  NSDirectionalEdgeInsets+AutoLayout.swift
//
//
//  Created by Óscar Morales Vivó on 8/20/22.
//

#if canImport(Cocoa)
import Cocoa
#elseif canImport(UIKit)
import UIKit
#endif

public extension NSDirectionalEdgeInsets {
    static let zero = NSDirectionalEdgeInsets()

    init(all: CGFloat) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }
}
