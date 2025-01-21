//
//  medicationData.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import Foundation

let medicationData: [Medication] = [metoprolol, aspirin, losartan]

let metoprolol = Medication(
	datePrescribed: DateFactory.createDateFromComponents(
		calendar: Calendar.current,
		 year: 2025,
		 month: 1,
		 day: 7),
	name: "Metoprolol",
	dose: Measurement(value: 25, unit: UnitMass.milligrams),
	route: "by mouth",
	frequency: 1,
	duration: 90)

let aspirin = Medication(
	datePrescribed: DateFactory.createDateFromComponents(
		calendar: Calendar.current,
		 year: 2025,
		 month: 1,
		 day: 8),
	name: "Aspirin",
	dose: Measurement(value: 81, unit: UnitMass.milligrams),
	route: "by mouth",
	frequency: 1,
	duration: 90)

let losartan = Medication(
	datePrescribed: DateFactory.createDateFromComponents(
		calendar: Calendar.current,
		 year: 2025,
		 month: 1,
		 day: 9),
	name: "Losartan",
	dose: Measurement(value: 12.5, unit: UnitMass.milligrams),
	route: "by mouth",
	frequency: 1,
	duration: 90)
