//
//  PrescribeMedicationForm.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import Foundation
import SwiftUI

struct PrescribeMedicationForm: View {
	@State private var medicationName: String = ""
	@State private var doseValue: Double = 0
	@State private var doseUnit: String = "milligrams"
	@State private var route: String = ""
	@State private var frequency: Int = 0
	@State private var duration: Int = 0
	@State private var datePrescribed: Date = DateFactory.now
	
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Enter Medication Name", text: $medicationName)
					
					MedicationDose(doseValue: $doseValue, doseUnit: $doseUnit)
					
					TextField("Enter Medication Route", text: $route)
					
					MedicationFrequency(frequency: $frequency)
					MedicationDuration(duration: $duration)
				}
			}
			.navigationTitle("Prescribe Medication")
			.onTapGesture {
				hideKeyboard()
			}
			.scrollContentBackground(.hidden)
			.toolbar {
				ToolbarItemGroup(placement: .navigationBarTrailing) {
					Button(action: {
						dismiss()
					}) {
						Text("Cancel")
					}
					
					// QUESTION - i try to prescribe medication, but not able to since only way i know how is to pass in patient but cant mutate patient if part of struct since self is immutable. how do i do this then?
					Button(action: {
						print("tries to prescribe medication")
					}) {
						Text("Prescribe")
					}
					.disabled(disableForm)
				}
			}
		}
		.accentColor(.green)
	}
	
	var disableForm: Bool {
		medicationName.isEmpty || doseValue == 0 || route.isEmpty || frequency == 0 || duration == 0
	}
	
	mutating func tryPrescribeMedication() throws {
//		let medication = Medication(
//			datePrescribed: <#T##Date#>,
//			name: <#T##String#>,
//			dose: <#T##Measurement<UnitMass>#>,
//			route: <#T##String#>,
//			frequency: <#T##Int#>,
//			duration: <#T##Int#>
//		)
//		
//		do {
//			try patient.prescribeMedication(medication)
//		} catch {
//			// TODO - show error message
//			print("Error prescribing medication: \(error)")
//		}
	}
}

#Preview {
	PrescribeMedicationForm()
}
