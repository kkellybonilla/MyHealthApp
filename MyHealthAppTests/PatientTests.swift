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
	var john: Patient
	
	init() {
		let dob = Date.createDateFromComponents(calendar: Calendar.current, year: 2000, month: 1, day: 1)
		john = Patient(
			firstName: "John",
			lastName: "Doe",
			dateOfBirth: dob,
			height: Measurement(value: 6, unit: UnitLength.feet),
			weight: Measurement(value: 200, unit: UnitMass.pounds),
			bloodType: BloodType.bNegative,
			medications: [])
	}
	
	@Test("Returns readable patient description") func testPatientDescription() {
		let simpleDescription = john.description
			.split(separator: "\n", maxSplits: 1, omittingEmptySubsequences: false)
		let simpleDescriptionWithoutUUID = "(medicalRecordNumber: MOCKED_UUID\n" + (
			simpleDescription.count > 1 ? simpleDescription[1] : "")
		let expectedDescription = """
			(medicalRecordNumber: MOCKED_UUID
			firstName: John
			lastName: Doe
			dateOfBirth: 2000-01-01 08:00:00 +0000
			height: 6.0 ft
			weight: 200.0 lb
			bloodType: B-
			medications: []
			age: 25)
			"""
		#expect(simpleDescriptionWithoutUUID == expectedDescription)
	}
    
    @Test("Returns patient's last name, first name (age)") func testNameAndAge() async {
		let expectedNameAndAge = "Doe, John (25)"
		#expect(john.nameAndAge() == expectedNameAndAge)
    }

	@Suite("Current Medications Tests") struct CurrentMedicationsTests {
		var metoprolol: Medication!
		var aspirin: Medication!
		var losartan: Medication!
		var john: Patient!
		
		init() {
			let metoprololDatePrescribed = Date.createDateFromComponents(
				calendar: Calendar.current,
				year: 2025,
				month: 1,
				day: 7)
			metoprolol = Medication(
				datePrescribed: metoprololDatePrescribed,
				name: "Metoprolol",
				dose: Measurement(value: 25, unit: UnitMass.milligrams),
				route: "by mouth",
				frequency: 1,
				duration: 90)
			
			let aspirinDatePrescribed = Date.createDateFromComponents(
				calendar: Calendar.current,
				year: 2025,
				month: 1,
				day: 8)
			aspirin = Medication(
				datePrescribed: aspirinDatePrescribed,
				name: "Aspirin",
				dose: Measurement(value: 81, unit: UnitMass.milligrams),
				route: "by mouth",
				frequency: 1,
				duration: 90)
			
			let losartanDatePrescribed = Date.createDateFromComponents(
				calendar: Calendar.current,
				year: 2025,
				month: 1,
				day: 9)
			
			losartan = Medication(
				datePrescribed: losartanDatePrescribed,
				name: "Losartan",
				dose: Measurement(value: 12.5, unit: UnitMass.milligrams),
				route: "by mouth",
				frequency: 1,
				duration: 90)
			
			let dob = Date.createDateFromComponents(
				calendar: Calendar.current,
				year: 2000,
				month: 1,
				day: 1)
			john = Patient(
				firstName: "John",
				lastName: "Doe",
				dateOfBirth: dob,
				height: Measurement(value: 6, unit: UnitLength.feet),
				weight: Measurement(value: 200, unit: UnitMass.pounds),
				bloodType: BloodType.bNegative,
				medications: [])
		}
		
		@Test("Returns medications the patient is currently taking") mutating func currentMedicationsReturns() {
			Date.mockNow = Date.createDateFromComponents(
						calendar: Calendar.current,
						year: 2025,
						month: 1,
						day: 10)
			
			john.medications = [metoprolol, aspirin, losartan]
			let expectedMedications: [Medication] = [metoprolol, aspirin, losartan]
			#expect(john.currentMedications() == expectedMedications)
		}
		
		@Test("Excludes any completed medications") mutating func currentMedicationsFilters() {
			Date.mockNow = Date.createDateFromComponents(
						calendar: Calendar.current,
						year: 2025,
						month: 4,
						day: 8)
			
			john.medications = [losartan]
			let expectedMedications: [Medication] = [losartan]
			#expect(john.currentMedications() == expectedMedications)
		}
		
		@Test("Orders medications by date prescribed") mutating func currentMedicationsSorts() {
			Date.mockNow = Date.createDateFromComponents(
						calendar: Calendar.current,
						year: 2025,
						month: 1,
						day: 10)
			
			john.medications = [losartan, metoprolol, aspirin]
			let expectedMedications: [Medication] = [metoprolol, aspirin, losartan]
			#expect(john.currentMedications() == expectedMedications)
		}
	}
    
	@Suite("Prescribe Medication Tests") struct PrescribeMedicationTests {
		var metoprolol: Medication!
		var john: Patient!
		
		init() {
			Date.mockNow = Date.createDateFromComponents(
						calendar: Calendar.current,
						year: 2025,
						month: 1,
						day: 10)
			
			let metoprololDatePrescribed = Date.createDateFromComponents(
				calendar: Calendar.current,
				year: 2025,
				month: 1,
				day: 7)
			metoprolol = Medication(
				datePrescribed: metoprololDatePrescribed,
				name: "Metoprolol",
				dose: Measurement(value: 25, unit: UnitMass.milligrams),
				route: "by mouth",
				frequency: 1,
				duration: 90)
			
			let dob = Date.createDateFromComponents(
				calendar: Calendar.current,
				year: 2000,
				month: 1,
				day: 1)
			john = Patient(
				firstName: "John",
				lastName: "Doe",
				dateOfBirth: dob,
				height: Measurement(value: 6, unit: UnitLength.feet),
				weight: Measurement(value: 200, unit: UnitMass.pounds),
				bloodType: BloodType.bNegative,
				medications: [])
		}
		
		@Test("Prescribes new medication to patient") mutating func prescribeMedicationReturns() {
			try? john.prescribeMedication(metoprolol)
			let expectedMedications = [metoprolol]
			#expect(john.medications == expectedMedications)
		}
				
		@Test("Throws error when prescribing duplicate medication")
		mutating func prescribeMedicationThrows() throws
		{
			john.medications = [metoprolol]
			#expect(throws: PatientError.duplicateMedication) {
				try john.prescribeMedication(metoprolol)
			}
		}
		
		@Test("Prescribes medication to patient if medication was completed")
		mutating func prescribeMedicationIfCompleted() {
			let newMetoprololDatePrescribed = Date.createDateFromComponents(
				calendar: Calendar.current,
				year: 2025,
				month: 4,
				day: 8)
			let newMetoprolol = Medication(
				datePrescribed: newMetoprololDatePrescribed,
				name: "Metoprolol",
				dose: Measurement(value: 25, unit: UnitMass.milligrams),
				route: "by mouth",
				frequency: 1,
				duration: 90)
			
			john.medications = [metoprolol]
			Date.mockNow = Date.createDateFromComponents(
						calendar: Calendar.current,
						year: 2025,
						month: 4,
						day: 8)
			
			try? john.prescribeMedication(newMetoprolol)
			let expectedMedications = [metoprolol, newMetoprolol]
			#expect(john.medications == expectedMedications)
		}
	}
}
