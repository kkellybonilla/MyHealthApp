//
//  Patient.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzman on 1/12/25.
//

import Foundation

enum PatientError: Error {
    case duplicateMedication
}

class Patient {
    let medicalRecordNumber: Int
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    var height: Measurement<UnitLength>
    var weight: Measurement<UnitMass>
    let bloodType: BloodType
    var medications: [String: Medication]
    
    let age: Int
    
    /// The medical record number assigned to each patient, ensuring that each is unique
    static var recordNumbers: Int = 0
    
    init(firstName: String,
         lastName: String,
         dateOfBirth: Date,
         height: Measurement<UnitLength>,
         weight: Measurement<UnitMass>,
         bloodType: BloodType,
         medications: [Medication])
    {
        self.medicalRecordNumber = Patient.recordNumbers
        Patient.recordNumbers += 1
        
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.height = height
        self.weight = weight
        self.bloodType = bloodType
        
        var medicationsMap: [String: Medication] = [:]
        for medication in medications {
            medicationsMap[medication.name] = medication
        }
        
        self.medications = medicationsMap
        self.age = Calendar.current.dateComponents([.year], from: dateOfBirth, to: .now).year
    }
    
    /// Returns the patient's full name and age in years
    ///
    /// - Returns: A string containing the patient's Last Name, First Name, Age (in years)
    func nameAndAge() -> String {
        return "\(lastName), \(firstName) (\(age))"
    }
    
    /// Returns whether or not the patient is currently taking the given medication based on the
    /// date prescribed and the duration for which it was prescribed
    ///
    /// - Parameter medication: The medication to check
    /// - Returns: `true` if the medication is still being taken, otherwise `false`
    private func isCurrentlyTaking(_ medication: Medication) -> Bool {
        let today: Date = .now
        let daysTaken = Calendar.current.dateComponents(
            [.day],
            from: medication.datePrescribed,
            to: today)
        
        return daysTaken.day! <= medication.duration
    }
    
    /// Returns the medications the patient is currently taking, ordered by date prescribed,
    /// excluding any completed medications
    ///
    /// - Returns: A list of medications the patient is currently taking
    func currentMedications() -> [Medication] {
        self.medications
            .values
            .filter { isCurrentlyTaking($0) }
            .sorted { $0.datePrescribed < $1.datePrescribed }
    }
    
    /// Attempts to prescribe a new medication to a patient by adding it to their list of
    /// medications, while avoiding duplicating the medications the patient is currently taking. If
    /// a duplicate is prescribed, the method throws an error.
    ///
    /// - Parameter medication: The medication to prescribe
    func prescribeMedication(_ medication: Medication) throws {
        /// Avoid prescribing duplicate medications
        guard medications[medication.name] == nil else {
            throw PatientError.duplicateMedication
        }
        
        self.medications[medication.name] = medication
    }
}

extension Patient: CustomStringConvertible {
    var description: String {
        simpleDescription()
    }
}
