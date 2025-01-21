//
//  PrescribeMedicationForm.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/19/25.
//

import Foundation
import SwiftUI

struct PrescribeMedicationForm: View {
	@State private var medicationName: String = ""
//	@State private var dose: Measurement<UnitMass>
	@State private var route: String = ""
	@State private var frequency: Int = 0
	@State private var duration: Int = 0
	@State private var datePrescribed: Date = DateFactory.now
	
    var body: some View {
		Form {
			Section {
				// Medication Name
				TextField("Enter Medication Name", text: $medicationName)
				// Dose
				// Route
				TextField("Enter Medication Route", text: $route)
				// Frequency
				HStack {
					Text("Take")
					TextField("Frequency", value: $frequency, format: .number)
						.textFieldStyle(.roundedBorder)
						.frame(maxWidth: 100)
					Text("times a day")
				}
				
				// Duration
				HStack(alignment: .center) {
					Text("For")
					TextField("Duration", value: $duration, format: .number)
						.textFieldStyle(.roundedBorder)
						.frame(maxWidth: 100)
					Text("day(s)")
				}
				
				// Date Prescribed
				DatePicker("Date Prescribed", selection: $datePrescribed, displayedComponents: [.date])
			}
		}
    }
}

#Preview {
    PrescribeMedicationForm()
}
