//
//  ActiveConstraintTests.swift
//
//
//  Created by Óscar Morales Vivó on 1/10/23.
//

@testable import AutoLayoutHelpers
import XCTest

final class ActiveConstraintTests: XCTestCase {
    private class DummyClass {
        init(view: XXView, constraint: NSLayoutConstraint? = nil) {
            // Using _constraint to exercise the initializer, although normally it'll go to nil and then do assignment.
            _constraint = .init(constraint: constraint)
            self.view = view
        }

        let view: XXView

        @ActiveConstraint
        var constraint: NSLayoutConstraint?
    }

    func testActiveConstraintInitialization() throws {
        let dummyView = XXView()
        let dummyInstance = DummyClass(
            view: dummyView,
            constraint: dummyView.widthAnchor.constraint(equalToConstant: 100.0)
        )
        XCTAssertNotNil(dummyInstance.constraint)
        XCTAssertEqual(dummyInstance.constraint?.isActive, true)
    }

    func testActiveConstraintSetting() throws {
        let dummyView = XXView()
        let narrowConstraint = dummyView.widthAnchor.constraint(equalToConstant: 10.0)
        let wideConstraint = dummyView.widthAnchor.constraint(equalToConstant: 100.0)
        let dummyInstance = DummyClass(view: dummyView)

        dummyInstance.constraint = narrowConstraint

        XCTAssertTrue(narrowConstraint.isActive)
        XCTAssertFalse(wideConstraint.isActive)

        dummyInstance.constraint = wideConstraint

        XCTAssertFalse(narrowConstraint.isActive)
        XCTAssertTrue(wideConstraint.isActive)

        dummyInstance.constraint = nil

        XCTAssertFalse(narrowConstraint.isActive)
        XCTAssertFalse(wideConstraint.isActive)
    }
}
