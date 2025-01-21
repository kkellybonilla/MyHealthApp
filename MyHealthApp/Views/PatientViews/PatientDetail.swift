//
//  PatientDetail.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import SwiftUI

struct PatientDetail: View {
	@State private var isShowingPrescribeMedicationForm: Bool = false
	@State private var isShowingBloodTransfusionList: Bool = false
	
	var patient: Patient
		
    var body: some View {
		NavigationStack {
			HStack {
				CircleImage(text: patient.initials)
					.offset(y: -130)
					.padding(.top, 150)
					.padding(.bottom, -130)
					.accessibilityLabel(Text(patient.initials))
				
				VStack {
					Text("\(patient.firstName) \(patient.lastName)")
						.font(.title)
					Text("\(patient.age) years old")
						.font(.title2)
						.foregroundStyle(.secondary)
				}
				.padding(.top, 20)
				.padding(.leading, 25)
			}
			.padding(.bottom, 30)
			.frame(maxWidth: .infinity)
			.background(Color(.green.opacity(0.5)))
			
			List {
				Section(header: Text("Patient Details")
					.font(.headline)) {
					HStack(alignment: .top) {
						Text("Medical Record Number: ")
							.fontWeight(.bold)
							.frame(width: 130)
						Text("\(patient.medicalRecordNumber)")
					}
					
					HStack(alignment: .top) {
						Text("Date of Birth: ")
							.fontWeight(.bold)
							.frame(width: 130, alignment: .leading)
						Text("\(patient.dateOfBirth.formatted(date: .numeric, time: .omitted))")
					}
					
					HStack {
						Text("Height: ")
							.fontWeight(.bold)
							.frame(width: 130, alignment: .leading)
						Text("\(patient.height.formatted())")
					}
					
					HStack {
						Text("Weight: ")
							.fontWeight(.bold)
							.frame(width: 130, alignment: .leading)
						Text("\(patient.weight.formatted())")
					}
					
					HStack {
						Text("Blood Type: ")
							.fontWeight(.bold)
							.frame(width: 130, alignment: .leading)
						Text("\(patient.bloodType)")
					}
				}
				
				Section(content: {
					PatientDetailButton(
						isShowing: $isShowingBloodTransfusionList,
						buttonText: "Get Blood Transfusion",
						buttonIcon: "syringe",
						buttonTint: .red
					)
					
					PatientDetailButton(
						isShowing: $isShowingPrescribeMedicationForm,
						buttonText: "Prescribe Medication",
						buttonIcon: "pills",
						buttonTint: .blue
					)
				})
				.listRowBackground(Color.clear)
				.listRowSeparator(.hidden)
				.padding([.leading, .trailing], -20)
				.sheet(isPresented: $isShowingPrescribeMedicationForm, content: {
					PrescribeMedicationForm()
				})

				Section(header:	Text("Current Medications")
					.font(.headline)) {
						let medications = patient.currentMedications()
						if medications.isEmpty {
							Text("This patient is not currently taking any medications.")
						} else {
							ForEach(patient.currentMedications()) { medication in
								NavigationLink {
									MedicationDetail(medication: medication)
								} label : {
									Text(medication.name)
								}
							}
					}
				}
			}
			.scrollContentBackground(.hidden)
			.background {
				Color.green.opacity(0.1)
			}
		}
    }
}

#Preview {
	PatientDetail(patient: patientData[0])
}
