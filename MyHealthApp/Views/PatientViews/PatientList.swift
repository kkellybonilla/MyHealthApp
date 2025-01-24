//
//  PatientList.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import SwiftUI

struct PatientList: View {
	@Bindable var patientList = PatientManager()
	
	@State private var isShowingNewPatientForm = false
	@State private var searchText = ""
	
	var body: some View {
		NavigationStack{
			List(searchResults) { patientBinding in
				PatientListRow(patientList: patientList, patient: patientBinding)
			}
			.navigationTitle("Patients")
			.scrollContentBackground(.hidden)
			.background {
				Color(.green.opacity(0.1)).edgesIgnoringSafeArea(.all)
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					NewPatientButton(isShowingNewPatientForm: $isShowingNewPatientForm, patientList: patientList)
				}
			}
		}
		.searchable(text: $searchText) {
			ForEach(searchResults) { patient in
				Text("Are you looking for \(patient.wrappedValue.lastName), \(patient.wrappedValue.firstName)?").searchCompletion(patient.wrappedValue.lastName)
			}
		}
		.accentColor(.green)
	}
	
	var searchResults: [Binding<Patient>] {
		let normalizedSearchText = searchText.lowercased()
		if normalizedSearchText.isEmpty {
			return $patientList.patients.sorted { $0.wrappedValue.lastName < $1.wrappedValue.lastName}
		} else {
			return $patientList.patients.filter { $0.wrappedValue.lastName.lowercased().contains(normalizedSearchText)
			}
		}
	}
}

#Preview {
	PatientList(patientList: PatientManager(patients: patientData))
}
