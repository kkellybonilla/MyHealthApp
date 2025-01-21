//
//  patientData.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import Foundation

let patientData: [Patient] = [
	Patient(firstName: "John",
			lastName: "Doe",
			dateOfBirth: DateFactory.createDateFromComponents(calendar: Calendar.current,
															  year: 2000,
															  month: 1,
															  day: 1),
			height: Measurement(value: 6.0, unit: UnitLength.feet),
			weight: Measurement(value: 200, unit: UnitMass.pounds),
			bloodType: BloodType.bNegative,
			medications: [metoprolol, aspirin, losartan]),
	Patient(firstName: "Jane",
			lastName: "Doe",
			dateOfBirth: DateFactory.createDateFromComponents(calendar: Calendar.current,
															  year: 2001,
															  month: 1,
															  day: 1),
			height: Measurement(value: 5.6, unit: UnitLength.feet),
			weight: Measurement(value: 160, unit: UnitMass.pounds),
			bloodType: BloodType.oPositive,
			medications: [])
]
