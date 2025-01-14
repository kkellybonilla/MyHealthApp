//
//  PatientTests.swift
//  MyHealthAppTests
//
//  Created by Kelly Bonilla Guzman on 1/12/25.
//

import Foundation
import Testing

@testable import MyHealthApp

struct PatientTests {
    let calendar = Calendar.current
    
    let metoprolol = Medication(datePrescribed: Date(), name: "Metoprolol", dose: Measurement(value: 25, unit: UnitMass.milligrams), route: "by mouth", frequency: 1, duration: 90)
    let aspirin = Medication(datePrescribed: Date(), name: "Aspirin", dose: Measurement(value: 81, unit: UnitMass.milligrams), route: "by mouth", frequency: 1, duration: 90)
    let losartan = Medication(datePrescribed: Date(), name: "Losartan", dose: Measurement(value: 12.5, unit: UnitMass.milligrams), route: "by mouth", frequency: 1, duration: 90)
    
    lazy var john: Patient = {
        let dob = Date.createDateFromComponents(calendar: calendar, year: 2000, month: 1, day: 1)
        
        return Patient(
            firstName: "John",
            lastName: "Doe",
            dateOfBirth: dob,
            height: Measurement(value: 6, unit: UnitLength.feet),
            weight: Measurement(value: 200, unit: UnitMass.pounds),
            bloodType: BloodType.bNegative,
            medications: [])
    }()
    
    lazy var jane: Patient = {
        let dob = Date.createDateFromComponents(calendar: calendar, year: 2000, month: 1, day: 1)
        
        return Patient(
            firstName: "Jane",
            lastName: "Doe",
            dateOfBirth: dob,
            height: Measurement(value: 5.6, unit: UnitLength.feet),
            weight: Measurement(value: 160, unit: UnitMass.pounds),
            bloodType: BloodType.abPositive,
            medications: [])
    }()
    
    @Test mutating func testNameAndAge() async {
        #expect(john.nameAndAge() == "Doe, John (25)")
        #expect(jane.nameAndAge() == "Doe, Jane (25)")
    }

    
    @Test func testCurrentMedications() async {
        
    }
    
    @Test func testPrescribeMedication() async throws {
        
    }
    
    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected condition
    }

}
