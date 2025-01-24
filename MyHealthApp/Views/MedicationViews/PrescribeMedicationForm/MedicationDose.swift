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
			TextField("Dosage", value: $doseValue, format: .number)
				.textFieldStyle(.roundedBorder)
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
	@Previewable @State var doseValue: Double = 0
	@Previewable @State var doseUnit: String = "milligrams"
	MedicationDose(doseValue: $doseValue, doseUnit: $doseUnit)
}
