//
//  BloodTypeTests.swift
//  MyHealthAppTests
//
//  Created by Kelly Bonilla Guzman on 1/13/25.
//

import Foundation
import Testing

@testable import MyHealthApp

struct BloodTypeTests {
	
	@Test("Returns readable blood type description") func testPatientDescription() {
		let aPositive = BloodType.aPositive
		let expectedAPositiveDescription = "A+"
		#expect(aPositive.description == expectedAPositiveDescription)
		
		let aNegative = BloodType.aNegative
		let expectedANegativeDescription = "A-"
		#expect(aNegative.description == expectedANegativeDescription)
		
		let bPositive = BloodType.bPositive
		let expectedBPositiveDescription = "B+"
		#expect(bPositive.description == expectedBPositiveDescription)
		
		let bNegative = BloodType.bNegative
		let expectedBNegativeDescription = "B-"
		#expect(bNegative.description == expectedBNegativeDescription)
		
		let oPositive = BloodType.oPositive
		let expectedOPositiveDescription = "O+"
		#expect(oPositive.description == expectedOPositiveDescription)
		
		let oNegative = BloodType.oNegative
		let expectedONegativeDescription = "O-"
		#expect(oNegative.description == expectedONegativeDescription)
		
		let abPositive = BloodType.abPositive
		let expectedABPositiveDescription = "AB+"
		#expect(abPositive.description == expectedABPositiveDescription)
		
		let abNegative = BloodType.abNegative
		let expectedABNegativeDescription = "AB-"
		#expect(abNegative.description == expectedABNegativeDescription)
	}
    
    @Test("Return correct blood type compatibility") func testCompatibleBloodTypes() async throws {
        let expectedCompatibilies: [BloodType: Set<BloodType>] = [
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
        
        for (bloodType, expectedCompatibility) in expectedCompatibilies {
            let actualCompatibility = BloodType.compatibleBloodTypes(bloodType)
            #expect(actualCompatibility == expectedCompatibility)
        }
    }
}
