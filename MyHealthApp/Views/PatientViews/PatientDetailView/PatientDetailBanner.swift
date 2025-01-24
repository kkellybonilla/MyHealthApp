//
//  PatientDetailBanner.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailBanner: View {
	var patient: Patient
	
    var body: some View {
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
		.background(.green.opacity(0.5))
    }
}

#Preview {
	PatientDetailBanner(patient: patientData[0])
}
