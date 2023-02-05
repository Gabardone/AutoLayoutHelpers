//
//  XXView+AutoLayoutTests.swift
//
//
//  Created by Óscar Morales Vivó on 1/10/23.
//

@testable import AutoLayoutHelpers
import XCTest

final class XXViewAutoLayoutTests: XCTestCase {
    // Verifies the API contract for XXView.add(subview:)
    func testAddSubview() {
        let superview = XXView()
        let bottomSubview = XXView()
        let topSubview = XXView()

        superview.add(subview: bottomSubview)
        superview.add(subview: topSubview)

        XCTAssertFalse(bottomSubview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(topSubview.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(superview.subviews.first, bottomSubview)
        XCTAssertEqual(superview.subviews.last, topSubview)
    }
}
