//
//  ViewController.swift
//  ThrowingTestExample
//
//  Created by Tim on 30/04/2017.
//  Copyright © 2017 duckett.de. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myString = "12345"
        
        let myThrower = MyThrowingClass()
        
        do {
            
            let result = try myThrower.someThrowingFunction(aParam: myString)
            // do something with result
            
        } catch let error as MyThrowingError {
            
            switch error {
                
            case .tooShort:
                // Do something
                break
                
            case .tooLong:
                // Do something
                break
                
            case .kaboom(let message):
                // Do something
                break
                
            }
            
        } catch {
            
            // Handle any non-MyThrowingError situations
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

