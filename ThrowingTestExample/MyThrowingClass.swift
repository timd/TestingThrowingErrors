//
//  MyThrowingClass.swift
//  ThrowingTestExample
//
//  Created by Tim on 30/04/2017.
//  Copyright © 2017 duckett.de. All rights reserved.
//

import Foundation

enum MyThrowingError: Error {
    case tooShort
    case tooLong
    case kaboom(message: String)
}

extension MyThrowingError: Equatable {
    
    static func == (lhs: MyThrowingError, rhs: MyThrowingError) -> Bool {
        
        switch (lhs, rhs) {
        case (.tooShort, .tooShort):
            return true;
            
        case (.tooLong, .tooLong):
            return true;
            
        case (.kaboom(let leftMessage), .kaboom(let rightMessage)):
            return leftMessage == rightMessage
            
        default:
            return false;
        }
    }
}

class MyThrowingClass {
    
    func someThrowingFunction(aParam: String) throws -> String? {
        
        if aParam == "plan" {
            throw MyThrowingError.kaboom(message: "You're only supposed to blow the bloody doors off!")
        }
        
        if aParam.characters.count < 5 {
            throw MyThrowingError.tooShort
        }
        
        if aParam.characters.count > 10 {
            throw MyThrowingError.tooLong
        }
        
        return "Did something with " + aParam
        
    }
    
}
