//
//  PatientDetailBloodType.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailBloodType: View {
	var bloodType: String
	
    var body: some View {
		HStack {
			Text("Blood Type: ")
				.fontWeight(.bold)
				.frame(width: 130, alignment: .leading)
			Text("\(bloodType)")
		}
    }
}

#Preview {
	PatientDetailBloodType(bloodType: patientData[0].bloodType.rawValue)
}
