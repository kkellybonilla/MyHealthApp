//
//  MedicationTests.swift
//  MyHealthAppTests
//
//  Created by Kelly Bonilla Guzmán on 1/14/25.
//

import Foundation
import Testing

@testable import MyHealthApp

struct MedicationTests {

	@Test("Returns readable medication description") func medicationDescriptionTest() {
		let metoprololDatePrescribed = DateFactory.createDateFromComponents(
			calendar: Calendar.current,
			year: 2025,
			month: 1,
			day: 7)
		let metoprolol = Medication(
			datePrescribed: metoprololDatePrescribed,
			name: "Metoprolol",
			dose: Measurement(value: 25, unit: UnitMass.milligrams),
			route: "by mouth",
			frequency: 1,
			duration: 90)
		
		let expectedDescription = """
			(datePrescribed: 2025-01-07 08:00:00 +0000
			name: Metoprolol
			dose: 25.0 mg
			route: by mouth
			frequency: 1
			duration: 90)
			"""
		
		#expect(expectedDescription == metoprolol.description)
	}
}
