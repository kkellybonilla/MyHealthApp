//
//  PatientDetailWeight.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/21/25.
//

import SwiftUI

struct PatientDetailWeight: View {
	var weight: Measurement<UnitMass>
	
    var body: some View {
		HStack {
			Text("Weight: ")
				.fontWeight(.bold)
				.frame(width: 130, alignment: .leading)
			Text("\(weight.formatted())")
		}
    }
}

#Preview {
	PatientDetailWeight(weight: Measurement(value: 160.0, unit: .pounds))
}
