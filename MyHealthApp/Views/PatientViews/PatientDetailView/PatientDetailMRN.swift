//
//  PatientDetailMRN.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailMRN: View {
	var medicalRecordNumber: UUID
	
    var body: some View {
		HStack(alignment: .top) {
			Text("Medical Record Number: ")
				.fontWeight(.bold)
				.frame(width: 130)
			Text("\(medicalRecordNumber)")
		}
    }
}

#Preview {
	PatientDetailMRN(medicalRecordNumber: patientData[0].medicalRecordNumber)
}
