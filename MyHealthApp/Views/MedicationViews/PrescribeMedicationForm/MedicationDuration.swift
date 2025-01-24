//
//  MedicationDuration.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct MedicationDuration: View {
	@Binding var duration: Int
	
    var body: some View {
		HStack(alignment: .center) {
			Text("For")
				.frame(minWidth: 0, maxWidth: 36)
			TextField("Duration", value: $duration, format: .number)
				.textFieldStyle(.roundedBorder)
				.frame(maxWidth: 100)
			Text("day(s)")
		}
    }
}

#Preview {
	MedicationDuration(duration: .constant(0))
}
