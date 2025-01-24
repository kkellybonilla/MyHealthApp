//
//  MedicationDetail.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/20/25.
//

import SwiftUI

struct MedicationDetail: View {
	var medication: Medication
	
    var body: some View {
		NavigationStack {
			Text(medication.name)
			Text("Ran out of time to implement :'(")
				.foregroundStyle(.secondary)
		}
    }
}

#Preview {
	MedicationDetail(medication: medicationData[0])
}
