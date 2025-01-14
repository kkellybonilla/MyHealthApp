//
//  Medication.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/12/25.
//

import Foundation

struct Medication {
    let datePrescribed: Date
    let name: String
    let dose: Measurement<UnitMass>
    let route: String
    let frequency: Int
    let duration: Int
}

extension Medication: CustomStringConvertible {
    var description: String {
        simpleDescription()
    }
}
