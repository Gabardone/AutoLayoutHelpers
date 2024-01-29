//
//  NSView+AutolayoutTests.swift
//
//
//  Created by Óscar Morales Vivó on 1/10/23.
//

#if os(macOS)
@testable import AutoLayoutHelpers
import XCTest

final class NSViewAutoLayoutTests: XCTestCase {
    // Verifies the API contract for NSView.add(subview:positioned:relativeTo:)
    func testAddSubviewPositionedRelativeTo() {
        let superview = NSView()
        let middleSubview = NSView()
        let bottomSubview = NSView()
        let topSubview = NSView()

        superview.add(subview: topSubview)
        superview.add(subview: bottomSubview, positioned: .below, relativeTo: nil)
        superview.add(subview: middleSubview, positioned: .above, relativeTo: bottomSubview)

        XCTAssertFalse(topSubview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(bottomSubview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(middleSubview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(superview.subviews.first, bottomSubview)
        XCTAssertEqual(superview.subviews[1], middleSubview)
        XCTAssertEqual(superview.subviews.last, topSubview)
    }
}
#endif
