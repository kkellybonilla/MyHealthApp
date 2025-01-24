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
				.frame(minWidth: 0, maxWidth: 36)
			TextField("Frequency", value: $frequency, format: .number)
				.textFieldStyle(.roundedBorder)
				.frame(maxWidth: 100)
			Text("time(s) a day")
		}
    }
}

#Preview {
	@Previewable @State var frequency: Int = 0
	MedicationFrequency(frequency: $frequency)
}
