//
//  PatientManager.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import Foundation

@Observable
class PatientManager {
	var patients: [Patient] = []
	
	init(patients: [Patient] = []) {
		self.patients = patients
	}
	
	func addPatient(_ patient: Patient) {
		self.patients.append(patient)
	}
}
