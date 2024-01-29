//
//  ActiveConstraintsTests.swift
//
//
//  Created by Óscar Morales Vivó on 1/10/23.
//

@testable import AutoLayoutHelpers
import XCTest

final class ActiveConstraintsTest: XCTestCase {
    private class DummyClass {
        init(view: XXView, constraints: [NSLayoutConstraint] = []) {
            // Using _constraint to exercise the initializer, although normally it'll go to nil and then do assignment.
            _constraints = .init(constraints: constraints)
            self.view = view
        }

        let view: XXView

        @ActiveConstraints
        var constraints: [NSLayoutConstraint]
    }

    func testActiveConstraintsInitialization() throws {
        let dummyView = XXView()
        let constraints = [
            dummyView.widthAnchor.constraint(equalToConstant: 50.0),
            dummyView.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        let dummyInstance = DummyClass(view: dummyView, constraints: constraints)

        XCTAssertEqual(dummyInstance.constraints, constraints)
        XCTAssertTrue(constraints.allSatisfy(\.isActive))
    }

    func testActiveConstraintsSetting() throws {
        let dummyView = XXView()
        let smallConstraints = [
            dummyView.widthAnchor.constraint(equalToConstant: 10.0),
            dummyView.heightAnchor.constraint(equalToConstant: 10.0)
        ]
        let largeConstraints = [
            dummyView.widthAnchor.constraint(equalToConstant: 100.0),
            dummyView.heightAnchor.constraint(equalToConstant: 100.0)
        ]
        let dummyInstance = DummyClass(view: dummyView)

        dummyInstance.constraints = smallConstraints

        XCTAssertTrue(smallConstraints.allSatisfy(\.isActive))
        XCTAssertTrue(largeConstraints.allSatisfy { !$0.isActive })

        dummyInstance.constraints = largeConstraints

        XCTAssertTrue(smallConstraints.allSatisfy { !$0.isActive })
        XCTAssertTrue(largeConstraints.allSatisfy(\.isActive))

        dummyInstance.constraints = []

        XCTAssertTrue(smallConstraints.allSatisfy { !$0.isActive })
        XCTAssertTrue(largeConstraints.allSatisfy { !$0.isActive })
    }
}
