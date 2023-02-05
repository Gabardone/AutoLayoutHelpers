//
//  NSLayoutConstraint+AutoLayoutTests.swift
//
//
//  Created by Óscar Morales Vivó on 1/10/23.
//

@testable import AutoLayoutHelpers
import XCTest

final class NSLayoutConstraintAutoLayoutTests: XCTestCase {
    // Sanity check.
    func testPriorityOperation() {
        let view = XXView()
        let almostRequired: XXLayoutPriority = .required - 1.0

        let constraint = view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0).priority(almostRequired)

        XCTAssertEqual(constraint.priority, almostRequired)
    }
}
