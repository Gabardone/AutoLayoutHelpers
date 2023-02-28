//
//  LayoutAreaTests.swift
//
//
//  Created by Óscar Morales Vivó on 1/10/23.
//

@testable import AutoLayoutHelpers
import XCTest

final class LayoutAreaTests: XCTestCase {
    func testConstraintsAgainstEnclosingLayoutArea() throws {
        let outerSize = CGSize(width: 100.0, height: 100.0)
        let view = XXView(frame: .init(origin: .zero, size: outerSize))
        view.constraints(forFixedSize: outerSize).activate()

        let layoutGuide = XXLayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let layoutGuideHeight = 30.0
        layoutGuide.heightAnchor.constraint(equalToConstant: layoutGuideHeight).activate()
        let insets = NSDirectionalEdgeInsets(top: 20.0, leading: 10.0, bottom: 20.0, trailing: 10.0)
        layoutGuide.constraintsAgainstEnclosing(
            layoutArea: view, edges: [.leading, .trailing, .bottom],
            insets: insets
        ).activate()
        view.layoutIfNeeded()

        XCTAssertEqual(layoutGuide.frame.height, layoutGuideHeight)
        #if os(macOS)
        // left-hand coordinate system.
        XCTAssertEqual(layoutGuide.frame.minY - view.bounds.minY, insets.bottom)
        #elseif os(iOS)
        // right-hand coordinate system.
        XCTAssertEqual(view.bounds.maxY - layoutGuide.frame.maxY, insets.bottom)
        #endif
        // We don't want to bother with RTL right now so offset is same on both sides.
        XCTAssertEqual(view.bounds.maxX - layoutGuide.frame.maxX, insets.trailing)
        XCTAssertEqual(layoutGuide.frame.minX - view.bounds.minX, insets.leading)
    }

    func testConstraintsAgainstEnclosingLayoutAreaVariadic() throws {
        let outerSize = CGSize(width: 100.0, height: 100.0)
        let view = XXView(frame: .init(origin: .zero, size: outerSize))
        view.constraints(forFixedSize: outerSize).activate()

        let layoutGuide = XXLayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let layoutGuideHeight = 30.0
        layoutGuide.heightAnchor.constraint(equalToConstant: layoutGuideHeight).activate()
        let horizontalInset = 10.0
        let bottomInset = 20.0
        layoutGuide.constraintsAgainstEnclosing(
            layoutArea: view,
            (inset: horizontalInset, edges: .horizontal), (inset: bottomInset, edges: .bottom)
        ).activate()
        view.layoutIfNeeded()

        XCTAssertEqual(layoutGuide.frame.height, layoutGuideHeight)
        #if os(macOS)
        // left-hand coordinate system.
        XCTAssertEqual(layoutGuide.frame.minY - view.bounds.minY, bottomInset)
        #elseif os(iOS)
        // right-hand coordinate system.
        XCTAssertEqual(view.bounds.maxY - layoutGuide.frame.maxY, bottomInset)
        #endif
        // We don't want to bother with RTL right now so offset is same on both sides.
        XCTAssertEqual(view.bounds.maxX - layoutGuide.frame.maxX, horizontalInset)
        XCTAssertEqual(layoutGuide.frame.minX - view.bounds.minX, horizontalInset)
    }

    func testConstraintsCenteringInLayoutArea() throws {
        let outerSize = CGSize(width: 100.0, height: 100.0)
        let view = XXView(frame: .init(origin: .zero, size: outerSize))
        view.constraints(forFixedSize: outerSize).activate()

        let layoutGuide = XXLayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let innerSize = CGSize(width: 50.0, height: 50.0)
        layoutGuide.constraints(forFixedSize: innerSize).activate()
        layoutGuide.constraintsCenteringIn(layoutArea: view).activate()
        view.layoutIfNeeded()

        XCTAssertEqual(layoutGuide.frame.size, innerSize)
        XCTAssertEqual(layoutGuide.frame.midX, view.bounds.midX)
        XCTAssertEqual(layoutGuide.frame.midY, view.bounds.midY)
    }

    func testConstraintsForFixedSize() throws {
        let size = CGSize(width: 100.0, height: 100.0)
        let view = XXView(frame: .init(origin: .zero, size: size))
        view.constraints(forFixedSize: size).activate()
        view.layoutIfNeeded()

        XCTAssertEqual(view.alignmentRect(forFrame: view.frame).size, size)
    }
}
