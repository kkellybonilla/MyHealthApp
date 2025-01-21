//
//  NewPatientButton.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct NewPatientButton: View {
	@Binding var isShowingNewPatientForm: Bool

    var body: some View {
		Button(action: {
			isShowingNewPatientForm.toggle()
		}) {
			HStack(content: {
				Text("Add Patient")
				Image(systemName: "plus")
			})
		}
		.sheet(isPresented: $isShowingNewPatientForm, content: {
			NewPatientForm()
		})
    }
}

#Preview {
	NewPatientButton(isShowingNewPatientForm: .constant(false))
}
