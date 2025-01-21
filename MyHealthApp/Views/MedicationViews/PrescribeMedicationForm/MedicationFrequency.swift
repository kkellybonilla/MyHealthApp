//
//  MedicationFrequency.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct MedicationFrequency: View {
	@Binding var frequency: Int
	
    var body: some View {
		HStack {
			Text("Take")
			TextField("Frequency", value: $frequency, format: .number)
				.textFieldStyle(.roundedBorder)
				.frame(maxWidth: 100)
			Text("times a day")
		}
    }
}

#Preview {
	MedicationFrequency(frequency: .constant(0))
}
