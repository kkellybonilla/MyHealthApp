//
//  BloodTransfusionListView.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/23/25.
//

import SwiftUI

struct BloodTransfusionListView: View {
	@Bindable var patientList: PatientManager
	@Binding var patient: Patient
	
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		NavigationView {
			BloodTransfusionList(patientList: patientList, patient: $patient)
				.background {
					Color(.green.opacity(0.1)).edgesIgnoringSafeArea(.all)
			}
			.navigationTitle("Get Blood Transfusion")
			.onTapGesture {
				hideKeyboard()
			}
			.scrollContentBackground(.hidden)
			.toolbar {
				ToolbarItem(content: {
					Button(action: {
						dismiss()
					}) {
						Text("Cancel")
					}
				})
			}
		}
		.accentColor(.green)
    }
}

#Preview {
	@Previewable @State var patient = patientData[0]
	BloodTransfusionListView(patientList: PatientManager(patients: patientData), patient: $patient)
}
