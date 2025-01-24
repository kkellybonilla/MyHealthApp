//
//  PatientDetailHeight.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailHeight: View {
	var height: Measurement<UnitLength>
	
    var body: some View {
		HStack {
			Text("Height: ")
				.fontWeight(.bold)
				.frame(width: 130, alignment: .leading)
			Text("\(height.formatted())")
		}
    }
}

#Preview {
	PatientDetailHeight(height: Measurement(value: 5.6, unit: .feet))
}
