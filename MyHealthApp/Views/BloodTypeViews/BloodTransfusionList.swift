//
//  BloodTransfusionList.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/22/25.
//

import SwiftUI

struct BloodTransfusionList: View {
	@Bindable var patientList: PatientManager
	@Binding var patient: Patient
	
	@Environment(\.dismiss) var dismiss
	
	/*
	 Text("Unfortunately, there are no patients that have compatible blood types with \(patient.firstName).").font(.subheadline).foregroundStyle(.secondary)
	 */
	
    var body: some View {
		let compatibleBloodTypes = patient.bloodType.compatibleBloodTypes
		let compatiblePatients = patientList.patients.filter {
				$0.id != patient.id && compatibleBloodTypes.contains($0.bloodType)
			}
		
		List {
			if compatiblePatients.isEmpty {
				Text("Unfortunately, there are no patients that have compatible blood types with \(patient.firstName).").font(.subheadline).foregroundStyle(.secondary)
					.listRowBackground(Color.clear)
			} else {
				Section(header:	Text("Other Patients")
					.font(.headline)) {
						Text("The following patients have compatible blood types with \(patient.firstName) and are eligble for a blood transfusion.").font(.subheadline).foregroundStyle(.secondary)
						ForEach(patientList.patients) { otherPatient in
							if patient.id != otherPatient.id && compatibleBloodTypes.contains(otherPatient.bloodType) {
								HStack {
									Text(otherPatient.firstName)
									Text(otherPatient.bloodType.rawValue)
								}
							}
						}
					}
					.listRowBackground(Color.clear)
			}
		}
    }
}

#Preview {
	@Previewable @State var patient = patientData[0]
	BloodTransfusionList(patientList: PatientManager(patients: patientData), patient: $patient)
}
