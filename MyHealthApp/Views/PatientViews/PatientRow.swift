//
//  PatientRow.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import SwiftUI

struct PatientRow: View {
	var patient: Patient
	
    var body: some View {
		HStack {
			Image(systemName: "person")
				.resizable()
				.frame(width: 35, height: 35)
			VStack(alignment: .leading) {
				Text(patient.nameAndAge)
				Text("Medical Record Number: \(patient.medicalRecordNumber)")
			}
			.padding([.horizontal], 5)
		}
		.padding([.horizontal], 20)
		.padding([.vertical], 10)
    }
}

#Preview {
	Group {
		PatientRow(patient: patientData[0])
	}
}
