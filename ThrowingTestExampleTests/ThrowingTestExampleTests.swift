//
//  ThrowingTestExampleTests.swift
//  ThrowingTestExampleTests
//
//  Created by Tim on 30/04/2017.
//  Copyright © 2017 duckett.de. All rights reserved.
//

import XCTest
@testable import ThrowingTestExample

class ThrowingTestExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_WhenProvidedWithTooShortParameter_shouldThrowTooShortError() {
        
        let throwingClass = MyThrowingClass()
        
        do {
            
            let _ = try throwingClass.someThrowingFunction(aParam: "123")
            
        } catch let error as MyThrowingError {
            
            XCTAssertEqual(error, MyThrowingError.tooShort)
            
        } catch {
            
            XCTFail("Unidentififed error thrown")
        }
        
    }

    func test_WhenProvidedWithTooLongParameter_shouldThrowTooLongError() {
        
        let throwingClass = MyThrowingClass()

        do {
            
            let _ = try throwingClass.someThrowingFunction(aParam: "12356789012345")
            
        } catch let error as MyThrowingError {
            
            XCTAssertEqual(error, MyThrowingError.tooLong)
            
        } catch {
            
            XCTFail("Unidentififed error thrown")
        }
        
    }

    func test_WhenProvidedWithParameterInRange_shouldReturnCorrectOutput() {
        
        let throwingClass = MyThrowingClass()

        do {
            
            let result = try throwingClass.someThrowingFunction(aParam: "1235678")
            XCTAssertEqual("Did something with 1235678", result)
            
        } catch let error {
            
            XCTFail("Unidentififed error thrown: \(error.localizedDescription)")
        }
        
    }

    func test_WhenProvidedWithParameterCausingExplosion_shouldThrowKaboomError() {
        
        let throwingClass = MyThrowingClass()
        
        do {
            
            let _ = try throwingClass.someThrowingFunction(aParam: "plan")
            
        } catch let error as MyThrowingError {
            
            XCTAssertEqual(error, MyThrowingError.kaboom(message: "You're only supposed to blow the bloody doors off!"))
            
        } catch {
            
            XCTFail("Unidentififed error thrown")
        }
        
    }
    
}
