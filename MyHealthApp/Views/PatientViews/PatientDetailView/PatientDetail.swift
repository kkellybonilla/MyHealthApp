//
//  PatientDetail.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import SwiftUI

enum PatientDetailSheet: Identifiable {
	case bloodTransfusionList
	case prescribeMedicationForm
	
	var id: String {
		switch self {
		case .bloodTransfusionList:
			return "bloodTransfusionList"
		case .prescribeMedicationForm:
			return "prescribeMedicationForm"
		}
	}
}

struct PatientDetail: View {
	@Bindable var patientList: PatientManager
	@Binding var patient: Patient
	
	@State var activeSheet: PatientDetailSheet?
		
    var body: some View {
		NavigationStack {
			PatientDetailBanner(patient: patient)
			
			List {
				Section(header: Text("Patient Details")
					.font(.headline)) {
					PatientDetailMRN(medicalRecordNumber: patient.medicalRecordNumber)
					PatientDetailDOB(dateOfBirth: patient.dateOfBirth)
					PatientDetailHeight(height: patient.height)
					PatientDetailWeight(weight: patient.weight)
					PatientDetailBloodType(bloodType: patient.bloodType.rawValue)
				}
				.listRowBackground(Color.clear)
				
				Section(content: {
					PatientDetailButton(
						activeSheet: $activeSheet,
						sheetType: .bloodTransfusionList,
						buttonText: "Get Blood Transfusion",
						buttonIcon: "syringe",
						buttonTint: .red
					)
					
					PatientDetailButton(
						activeSheet: $activeSheet,
						sheetType: .prescribeMedicationForm,
						buttonText: "Prescribe Medication",
						buttonIcon: "pills",
						buttonTint: .blue
					)
				})
				.listRowBackground(Color.clear)
				.listRowSeparator(.hidden)
				.padding([.leading, .trailing], -20)

				Section(header:	Text("Current Medications")
					.font(.headline)) {
						PatientDetailCurrentMedications(patient: $patient)
				}
				.listRowBackground(Color.clear)
			}
			.sheet(item: $activeSheet) { item in
				switch item {
					case .prescribeMedicationForm:
						PrescribeMedicationForm(patient: $patient)
					case .bloodTransfusionList:
					BloodTransfusionListView(patientList: patientList, patient: $patient)
					}
			}
			.scrollContentBackground(.hidden)
			.background {
				Color.green.opacity(0.1)
			}.edgesIgnoringSafeArea(.all)
		}
		.accentColor(.green)
    }
}

#Preview {
	@Previewable @State var patient = patientData[0]
	PatientDetail(patientList: PatientManager(patients: patientData), patient: $patient)
}
