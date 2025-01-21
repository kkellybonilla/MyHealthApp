//
//  PatientList.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import SwiftUI

// QUESTION - how to use @Observable for managing the patient list?

struct PatientList: View {
	@State private var isShowingNewPatientForm = false
	@State private var searchText = ""
	
	var body: some View {
		NavigationStack{
			List(searchResults, id: \.self) { patient in
				PatientListRow(patient: patient)
			}
			.navigationTitle("Patients")
			.scrollContentBackground(.hidden)
			.background {
				Color(.green.opacity(0.1)).edgesIgnoringSafeArea(.all)
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					NewPatientButton(isShowingNewPatientForm: $isShowingNewPatientForm)
				}
			}
		}
		.searchable(text: $searchText) {
			ForEach(searchResults, id: \.self) { patient in
				Text("Are you looking for \(patient.lastName), \(patient.firstName)?").searchCompletion(patient.lastName)
			}
		}
		.accentColor(.green)
	}
	
	var searchResults: [Patient] {
		let normalizedSearchText = searchText.lowercased()
		if normalizedSearchText.isEmpty {
			return patientData.sorted { $0.lastName < $1.lastName}
		} else {
			return patientData.filter { $0.lastName.lowercased().contains(normalizedSearchText) }
		}
	}
}

#Preview {
    PatientList()
}
