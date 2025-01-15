//
//  BloodType.swift
//  MyHealthApp
//
//  Created by Kelly Bonilla Guzman on 1/12/25.
//

import Foundation

enum BloodType {
    case aPositive, aNegative, bPositive, bNegative, oPositive, oNegative, abPositive, abNegative
    
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
    
    /// Returns a set of donor blood types a patient can receive a blood transfusion from
    ///
    /// - Parameter bloodType: The blood type to check
    /// - Returns: A set of compatible blood types
    static func compatibleBloodTypes(_ bloodType: BloodType) -> Set<BloodType> {
        BloodType.bloodTypeCompatibility[bloodType] ?? []
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
