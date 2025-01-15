//
//  CustomStringConvertible+Utilities.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzman on 1/12/25.
//
//  Code from Article "Use auto-describing objects with CustomStringConvertible" by Yogev Sitton
//  Article URL: https://medium.com/@YogevSitton/use-auto-describing-objects-with-customstringconvertible-49528b55f446
//

import Foundation

extension CustomStringConvertible {
    /// Returns readable description of a custom type
    func simpleDescription() -> String {
        var description: String = "("
        let mirror = Mirror(reflecting: self)
        
        for (propertyName, value) in mirror.children {
            if let propertyName = propertyName {
                description += "\(propertyName): \(value)\n"
            }
        }
        
		return description.dropLast() + ")"
    }
}
