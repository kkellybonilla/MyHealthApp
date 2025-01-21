//
//  BloodType.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzman on 1/12/25.
//

import Foundation

enum BloodType: String, CaseIterable {
	case aPositive = "A+"
	case aNegative = "A-"
	case bPositive = "B+"
	case bNegative = "B-"
	case oPositive = "O+"
	case oNegative = "O-"
	case abPositive = "AB+"
	case abNegative = "AB-"
    
    static private let bloodTypeCompatibility: [BloodType: Set<BloodType>] = [
        .aPositive: [.aPositive, .aNegative, .oPositive, .oNegative],
        .aNegative: [.aNegative, .oNegative],
        .bPositive: [.bPositive, .bNegative, .oPositive, .oNegative],
        .bNegative: [.bNegative, .oNegative],
        .oPositive: [.oPositive, .oNegative],
        .oNegative: [.oNegative],
        .abPositive: [.aPositive, .aNegative, .bPositive, .bNegative, .oPositive, .oNegative,
                      .abPositive, .abNegative],
        .abNegative: [.aNegative, .bNegative, .oNegative, .abNegative]
    ]
    
	var compatibleBloodTypes: Set<BloodType> {
		BloodType.bloodTypeCompatibility[self] ?? []
	}
}

extension BloodType: CustomStringConvertible {
	var description: String {
		switch self {
		case .aPositive:
			return "A+"
		case .aNegative:
			return "A-"
		case .bPositive:
			return "B+"
		case .bNegative:
			return "B-"
		case .oPositive:
			return "O+"
		case .oNegative:
			return "O-"
		case .abPositive:
			return "AB+"
		case .abNegative:
			return "AB-"
		}
	}
}
