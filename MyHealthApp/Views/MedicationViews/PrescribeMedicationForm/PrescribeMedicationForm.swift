//
//  PrescribeMedicationForm.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import Foundation
import SwiftUI

struct PrescribeMedicationForm: View {
	@Binding var patient: Patient
	
	@Environment(\.dismiss) var dismiss
	
	@State private var medicationName: String = ""
	@State private var doseValue: Double = 0
	@State private var doseUnit: String = "kilograms"
	@State private var route: String = ""
	@State private var frequency: Int = 0
	@State private var duration: Int = 0
	@State private var datePrescribed: Date = DateFactory.now
	@State private var isShowingErrorAlert = false
	
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
				.listRowBackground(Color.clear)
			}
			.background {
				Color(.green.opacity(0.1)).edgesIgnoringSafeArea(.all)
			}
			.navigationTitle("Prescribe Medication")
			.onTapGesture {
				hideKeyboard()
			}
			.scrollContentBackground(.hidden)
			.toolbar {
				ToolbarItemGroup(placement: .navigationBarTrailing) {
					CancelButton {
						dismiss()
					}
					
					Button(action: {
						do {
							try tryPrescribeMedication()
						} catch {
							isShowingErrorAlert = true
						}
					}) {
						Text("Prescribe")
					}
					.alert("Cannot Prescribe Duplicate Medications", isPresented: $isShowingErrorAlert) {
						
					} message: {
						Text("The medication \(medicationName) is already currently prescribed to this patient.")
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
	
	func tryPrescribeMedication() throws {
		let doseUnitsMap: [String: UnitMass] = ["kilograms": .kilograms, "grams": .grams, "milligrams": .milligrams, "micrograms": .micrograms]
		var doseUnitMass: UnitMass {
			doseUnitsMap[doseUnit]!
		}
		
		let medication = Medication(
			datePrescribed: DateFactory.now,
			name: medicationName,
			dose: Measurement(value: doseValue, unit: doseUnitMass),
			route: route,
			frequency: frequency,
			duration: duration)

		try patient.prescribeMedication(medication)
		dismiss()
	}
}

#Preview {
	@Previewable @State var patient = patientData[0]
	PrescribeMedicationForm(patient: $patient)
}
