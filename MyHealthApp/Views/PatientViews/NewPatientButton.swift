//
//  NewPatientButton.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct NewPatientButton: View {
	@Binding var isShowingNewPatientForm: Bool
	@Bindable var patientList: PatientManager

    var body: some View {
		Button(action: {
			isShowingNewPatientForm.toggle()
		}) {
			HStack(content: {
				Text("Add Patient")
				Image(systemName: "plus")
			})
		}
		.sheet(isPresented: $isShowingNewPatientForm, content: {
			NewPatientForm(patientList: patientList)
		})
    }
}

#Preview {
	@Previewable @State var isShowingNewPatientForm: Bool = false
	NewPatientButton(isShowingNewPatientForm: $isShowingNewPatientForm, patientList: PatientManager(patients: patientData))
}
