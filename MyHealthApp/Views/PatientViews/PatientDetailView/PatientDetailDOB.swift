//
//  PatientDetailDOB.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailDOB: View {
	var dateOfBirth: Date
	
    var body: some View {
		HStack(alignment: .top) {
			Text("Date of Birth: ")
				.fontWeight(.bold)
				.frame(width: 130, alignment: .leading)
			Text("\(dateOfBirth.formatted(date: .numeric, time: .omitted))")
		}
    }
}

#Preview {
	PatientDetailDOB(dateOfBirth: patientData[0].dateOfBirth)
}
