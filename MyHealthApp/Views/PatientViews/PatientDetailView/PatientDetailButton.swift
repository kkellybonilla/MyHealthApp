//
//  PatientDetailButton.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailButton: View {
	@Binding var activeSheet: PatientDetailSheet?
	
	var sheetType: PatientDetailSheet
	var buttonText: String
	var buttonIcon: String
	var buttonTint: Color
	
    var body: some View {
		Button(action: {
			if activeSheet == nil {
				activeSheet = sheetType
			}
		}) {
			HStack(content: {
				Text(buttonText)
				Image(systemName: buttonIcon)
			})
			.fontWeight(.semibold)
			.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
			.padding(10)
		}
		.buttonStyle(.bordered)
		.tint(buttonTint)
		.cornerRadius(20)
		.padding([.bottom], -10)
    }
}

#Preview {
	@Previewable @State var activeSheet: PatientDetailSheet? = nil
	PatientDetailButton(
		activeSheet: $activeSheet,
		sheetType: .prescribeMedicationForm,
		buttonText: "Button Text",
		buttonIcon: "circle",
		buttonTint: .black
	)
}
