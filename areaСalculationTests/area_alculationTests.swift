//
//  area_alculationTests.swift
//  areaСalculationTests
//
//  Created by Илья Акулов on 13.02.2024.
//

import XCTest
@testable import areaСalculation

final class area_alculationTests: XCTestCase {
    // MARK: - Тест круга

    class CircleTests: XCTestCase {
        
        var circle: Circle!
        
        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
            circle = Circle(radius: 5)
        }
        
        override func tearDownWithError() throws {
            try super.setUpWithError()
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            circle = nil
        }
        
        func testExample() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            // Any test you write for XCTest can be annotated as throws and async.
            // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
            // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
            
            
            //              Тест Круга
            let circle = Circle(radius: 5)
            let expectedArea = Double.pi * pow(5, 2)
            XCTAssertEqual(circle.getArea(), expectedArea, accuracy: 0.001)
            
        }
        
        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            measure {
                // Put the code you want to measure the time of here.
            }
        }
    }
    
    // MARK: - тест Триугольника

    class TriangleTests: XCTestCase {
        
        var triangle: Triangle!
        
        override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
            triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
            let area = triangle.getArea()
            XCTAssertEqual(area, 6, accuracy: 0.001, "Incorrect area calculation")
        }
        
        override func tearDownWithError() throws {
            try super.setUpWithError()
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            triangle = nil
        }
        
        func testExample() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            // Any test you write for XCTest can be annotated as throws and async.
            // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
            // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
            
            
            //              Тест треугольника
        
            let rightTriangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
            let notRightTriangle = Triangle(sideA: 2, sideB: 3, sideC: 4)
            
           
            let isRight1 = rightTriangle.isRightTriangle()
            let isRight2 = notRightTriangle.isRightTriangle()
            
  
            XCTAssertTrue(isRight1, "Expected right triangle")
            XCTAssertFalse(isRight2, "Expected non-right triangle")
            
        }
        
        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            measure {
                // Put the code you want to measure the time of here.
            }
        }
    }
}
