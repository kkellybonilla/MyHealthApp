//
//  CircleImage.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzmán on 1/20/25.
//

import SwiftUI

struct CircleImage: View {
	var text: String
	
	var body: some View {
		Circle()
			.fill(.quaternary)
			.overlay {
				ZStack {
					Text(text)
						.font(.system(size: 50))
						.fontWeight(.light)
					Circle()
						.stroke(.white, lineWidth: 4)
				}
			}
			.shadow(radius: 7)
			.frame(maxWidth: 100)
		
	}
}

#Preview {
	CircleImage(text: "JD")
}
