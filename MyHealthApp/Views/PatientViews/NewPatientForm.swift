//
//  NewPatientForm.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct NewPatientForm: View {
	@Bindable var patientList: PatientManager
	
	@State private var firstName: String = ""
	@State private var lastName: String = ""
	@State private var dateOfBirth: Date = DateFactory.now
	@State private var heightValue: Double = 5.11
	@State private var weightValue: Double = 160.0
	@State private var bloodType: BloodType = .aPositive

	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		NavigationView {
			Form {
				Section(header: Text("Required Patient Information")) {
					HStack {
						Text("First Name: ")
						TextField("Johnny", text: $firstName)
					}
					
					HStack {
						Text("Last Name: ")
						TextField("Applesmith", text: $lastName)
					}
					
					DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
					
					HStack {
						Text("Height: ")
						TextField("5.11", value: $heightValue, format: .number)
							.frame(minWidth: 0, maxWidth: 35)
						Text("ft")
					}
					
					HStack {
						Text("Weight: ")
						TextField("160", value: $weightValue, format: .number)
							.frame(minWidth: 0, maxWidth: 35)
						Text("lbs")
					}
				}
				.listRowBackground(Color.clear)
				
				Section(header: Text("Optional Patient Information")) {
					HStack {
						Text("Blood Type: ")
						Picker("", selection: $bloodType) {
							ForEach(BloodType.allCases, id: \.self) {
								Text($0.rawValue)
							}
						}
						.pickerStyle(.wheel)
						.padding(.vertical, -50)
					}
				}
				.listRowBackground(Color.clear)
			}
			.navigationTitle("New Patient")
			.onTapGesture {
				hideKeyboard()
			}
			.scrollContentBackground(.hidden)
			.background {
				Color(.green.opacity(0.1)).edgesIgnoringSafeArea(.all)
			}
			.toolbar {
				ToolbarItemGroup(placement: .navigationBarTrailing) {
					CancelButton {
						dismiss()
					}
					
					Button(action: {
						savePatient()
					}) {
						Text("Save")
					}
					.disabled(disableForm)
				}
			}
		}
		.accentColor(.green)
	}
	
	var disableForm: Bool {
		firstName.isEmpty || lastName.isEmpty || heightValue == 0 || weightValue == 0 || dateOfBirth > DateFactory.now
	}

	func savePatient() {
		let newPatient = Patient(
			firstName: firstName,
			lastName: lastName,
			dateOfBirth: dateOfBirth,
			height: Measurement(value: heightValue, unit: .feet),
			weight: Measurement(value: weightValue, unit: .pounds),
			bloodType: bloodType,
			medications: []
		)
		
		patientList.addPatient(newPatient)
		dismiss()
	}
}

#Preview {
	NewPatientForm(patientList: PatientManager(patients: patientData))
}

#if canImport(UIKit)
extension View {
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
#endif
