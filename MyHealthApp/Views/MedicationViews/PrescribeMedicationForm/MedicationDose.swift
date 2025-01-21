//
//  MedicationDose.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct MedicationDose: View {
	@Binding var doseValue: Double
	@Binding var doseUnit: String
	
	let doseUnits = ["kilograms", "grams", "milligrams", "micrograms"]
	
    var body: some View {
		HStack {
			Text("Enter Dose: ")
			TextField("", value: $doseValue, format: .number)
				.frame(minWidth: 0, maxWidth: 35)
			Picker("", selection: $doseUnit) {
				ForEach(doseUnits, id: \.self) {
					Text($0)
				}
			}
			.pickerStyle(.wheel)
		}
    }
}

#Preview {
	MedicationDose(doseValue: .constant(0), doseUnit: .constant("milligrams"))
}
