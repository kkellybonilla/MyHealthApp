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

struct Patient: Identifiable, Hashable {
	let id: UUID
	let medicalRecordNumber: UUID
	let firstName: String
	let lastName: String
	let dateOfBirth: Date
	var height: Measurement<UnitLength>
	var weight: Measurement<UnitMass>
	let bloodType: BloodType
	var medications: [Medication]
	
	var age: Int {
		Calendar.current.dateComponents([.year], from: dateOfBirth, to: DateFactory.now).year!
	}
	
	var nameAndAge: String {
		"\(lastName), \(firstName) (\(age))"
	}
	
	var initials: String {
		if firstName.first == nil || lastName.first == nil {
			return "N/A"
		}
		
		return "\(firstName.first!)\(lastName.first!)"
	}
		
	init(firstName: String,
		 lastName: String,
		 dateOfBirth: Date,
		 height: Measurement<UnitLength>,
		 weight: Measurement<UnitMass>,
		 bloodType: BloodType,
		 medications: [Medication])
	{
		self.id = UUID()
		self.medicalRecordNumber = UUID()
		self.firstName = firstName
		self.lastName = lastName
		self.dateOfBirth = dateOfBirth
		self.height = height
		self.weight = weight
		self.bloodType = bloodType
		self.medications = medications
		}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
    
    /// Returns whether or not the patient is currently taking the given medication based on the
    /// date prescribed and the duration for which it was prescribed
	/// Assumes that the patient begins taking the medication the date it was prescribed
    ///
    /// - Parameter medication: The medication to check
    /// - Returns: `true` if the medication is still being taken, otherwise `false`
    private func isCurrentlyTaking(_ medication: Medication) -> Bool {
		let today: Date = DateFactory.now
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
				currentMedicationNames.insert(medication.name.lowercased())
			}
		}
		
		/// Avoid prescribing duplicate medications
		let normalizedMedication = medication.name.lowercased()
		if currentMedicationNames.contains(normalizedMedication) {
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
