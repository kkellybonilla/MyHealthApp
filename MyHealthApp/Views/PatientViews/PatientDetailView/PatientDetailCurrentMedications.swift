//
//  PatientDetailCurrentMedications.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailCurrentMedications: View {
	@Binding var patient: Patient
	
    var body: some View {
		let medications = patient.currentMedications()
		if medications.isEmpty {
			Text("This patient is not currently taking any medications.")
		} else {
			ForEach(medications) { medication in
				NavigationLink {
					MedicationDetail(medication: medication)
				} label : {
					Text(medication.name)
				}
			}
		}
    }
}

#Preview {
	@Previewable @State var patient: Patient = patientData[0]
	PatientDetailCurrentMedications(patient: $patient)
}
