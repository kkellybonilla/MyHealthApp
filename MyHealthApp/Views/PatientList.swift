//
//  PatientList.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import SwiftUI

struct PatientList: View {
	
	var body: some View {
		NavigationSplitView {
			List(patientData) { patient in
				NavigationLink {
					PatientDetail(patient: patient)
				} label: {
					PatientRow(patient: patient)
				}
			}
			.navigationTitle("Patients")
		} detail: {
			Text("Select a patient")
		}
	}
}

#Preview {
    PatientList()
}
