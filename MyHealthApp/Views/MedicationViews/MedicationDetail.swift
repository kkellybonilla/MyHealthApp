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
		VStack {
			Text(medication.name)
		}
    }
}

#Preview {
	MedicationDetail(medication: medicationData[0])
}
