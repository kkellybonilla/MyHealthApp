//
//  PatientListRow.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientListRow: View {
	@Bindable var patientList: PatientManager
	@Binding var patient: Patient

		var body: some View {
			NavigationLink(destination: {
				PatientDetail(patientList: patientList, patient: $patient)
			}, label: {
				PatientRow(patient: $patient)
			})
			.listRowBackground(RoundedRectangle(cornerRadius: 30)
				.fill(.green.opacity(0.5))
				.padding([.top, .bottom], 2)
			)
		}
}

#Preview {
	@Previewable @State var patient: Patient = patientData[0]
	PatientListRow(patientList: PatientManager(patients: patientData), patient: $patient)
}
