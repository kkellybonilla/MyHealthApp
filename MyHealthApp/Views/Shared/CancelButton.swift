//
//  CancelButton.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/24/25.
//

import SwiftUI

struct CancelButton: View {
	let action: () -> Void
		
	var body: some View {
		Button(action: action) {
			Text("Cancel")
		}
	}
}

#Preview {
	CancelButton {
		print("Cancel button tapped")
	}
}
