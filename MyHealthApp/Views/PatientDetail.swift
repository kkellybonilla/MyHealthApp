//
//  PatientDetail.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import SwiftUI

struct PatientDetail: View {
	@State private var isShowingFullMRN: Bool = false
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
				
				Section {
					Button(action: {
						print("Button tapped")
					}) {
						HStack {
							Text("Needs Blood Transfusion")
							Image(systemName: "syringe")
						}
						.frame(maxWidth: .infinity, alignment: .center)
						.foregroundStyle(.red)
					}
					.listRowBackground(Color.red.opacity(0.2))
					.padding(.vertical, 8)
				}
				
				Section {
					Button(action: {
						print("Button tapped")
					}) {
						HStack {
							Text("Prescribe Medication")
							Image(systemName: "pills")
						}
						.frame(maxWidth: .infinity, alignment: .center)
					}
					.listRowBackground(Color.blue.opacity(0.2))
					.padding(.vertical, 8)
				}
				
				Section(header:	Text("Current Medications")
					.font(.headline)) {
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
    }
}

#Preview {
	PatientDetail(patient: patientData[0])
}
