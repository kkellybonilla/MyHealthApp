//
//  PatientListRow.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientListRow: View {
	let patient: Patient

		var body: some View {
			NavigationLink {
				PatientDetail(patient: patient)
			} label: {
				PatientRow(patient: patient)
			}
			.listRowBackground(RoundedRectangle(cornerRadius: 30)
				.fill(Color(.green.opacity(0.5)))
				.padding([.top, .bottom], 2)
			)
		}
}

#Preview {
	PatientListRow(patient: patientData[0])
}
