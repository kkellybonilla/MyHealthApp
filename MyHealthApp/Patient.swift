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

struct Patient {
	let medicalRecordNumber: UUID = UUID()
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    var height: Measurement<UnitLength>
    var weight: Measurement<UnitMass>
    let bloodType: BloodType
    var medications: [Medication]
	
    let age: Int
    
    init(firstName: String,
         lastName: String,
         dateOfBirth: Date,
         height: Measurement<UnitLength>,
         weight: Measurement<UnitMass>,
         bloodType: BloodType,
         medications: [Medication])
    {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.height = height
        self.weight = weight
        self.bloodType = bloodType
        self.medications = medications
        self.age = Calendar.current.dateComponents([.year], from: dateOfBirth, to: .now).year!
    }
    
    /// Returns the patient's full name and age in years
    ///
    /// - Returns: A string containing the patient's Last Name, First Name, Age (in years)
    func nameAndAge() -> String {
        return "\(lastName), \(firstName) (\(age))"
    }
    
    /// Returns whether or not the patient is currently taking the given medication based on the
    /// date prescribed and the duration for which it was prescribed
	/// Assumes that the patient begins taking the medication the date it was prescribed
    ///
    /// - Parameter medication: The medication to check
    /// - Returns: `true` if the medication is still being taken, otherwise `false`
    private func isCurrentlyTaking(_ medication: Medication) -> Bool {
        let today: Date = .now
        let daysTaken = Calendar.current.dateComponents(
            [.day],
            from: medication.datePrescribed,
            to: today)
        
        return daysTaken.day! + 1 <= medication.duration
    }
    
    /// Returns the medications the patient is currently taking, ordered by date prescribed,
    /// excluding any completed medications
    ///
    /// - Returns: A list of medications the patient is currently taking
    func currentMedications() -> [Medication] {
        self.medications
            .filter { isCurrentlyTaking($0) }
            .sorted { $0.datePrescribed < $1.datePrescribed }
    }
    
    /// Attempts to prescribe a new medication to a patient by adding it to their list of
    /// medications, while avoiding duplicating the medications the patient is currently taking. If
    /// a duplicate is prescribed, the method throws an error.
    ///
    /// - Parameter medication: The medication to prescribe
    mutating func prescribeMedication(_ medication: Medication) throws {
		var currentMedicationNames: Set<String> = []
		for medication in self.medications {
			if self.isCurrentlyTaking(medication) {
				currentMedicationNames.insert(medication.name)
			}
		}
		
		/// Avoid prescribing duplicate medications
		if currentMedicationNames.contains(medication.name) {
            throw PatientError.duplicateMedication
        }
        
		self.medications.append(medication)
    }
}

extension Patient: CustomStringConvertible {
    var description: String {
        simpleDescription()
    }
}
