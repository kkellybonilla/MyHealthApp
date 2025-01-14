//
//  BloodTypeTests.swift
//  MyHealthAppTests
//
//  Created by Kelly Bonilla Guzman on 1/13/25.
//

import Testing

@testable import MyHealthApp

struct BloodTypeTests {
    
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
