//
//  PatientUITests.swift
//  MyHealthAppUITests
//
//  Created by Kelly Bonilla Guzmán on 1/23/25.
//

import XCTest

final class PatientUITests: XCTestCase {
	let app = XCUIApplication()
	
	override func setUp() {
		continueAfterFailure = false
		app.launch()
	}

    func testPrescribeMedication() throws {
		// Add patient Baby Doe
		app.buttons["Add Patient"].tap()
		XCTAssert(app.staticTexts["New Patient"].isHittable)
		
		app.textFields["Johnny"].tap()
		app.textFields["Johnny"].typeText("Baby")
		app.textFields["Applesmith"].tap()
		app.textFields["Applesmith"].typeText("Doe")
		app.buttons["Save"].tap()
		XCTAssert(app.staticTexts["Doe, Baby (0)"].isHittable)
		
		// View Baby Doe's details
		app.buttons.containing(NSPredicate(format: "label CONTAINS %@", "Doe, Baby")).firstMatch.tap()
		XCTAssert(app.staticTexts["Baby Doe"].isHittable)
		
		// Prescribe Baby Doe medication
		app.buttons["Prescribe Medication"].tap()
		app.textFields["Enter Medication Name"].tap()
		app.textFields["Enter Medication Name"].typeText("Ilotycin")
		app.textFields["Dosage"].tap()
		app.textFields["Dosage"].typeText("200")
		app.textFields["Enter Medication Route"].tap()
		app.textFields["Enter Medication Route"].typeText("By application")
		app.textFields["Frequency"].tap()
		app.textFields["Frequency"].typeText("1")
		app.textFields["Duration"].tap()
		app.textFields["Duration"].typeText("1")
		app.buttons["Prescribe"].tap()
		XCTAssert(app.staticTexts["Ilotycin"].isHittable)
		
		// Attempt to prescribe duplicate medication
		app.buttons["Prescribe Medication"].tap()
		app.textFields["Enter Medication Name"].tap()
		app.textFields["Enter Medication Name"].typeText("Ilotycin")
		app.textFields["Dosage"].tap()
		app.textFields["Dosage"].typeText("200")
		app.textFields["Enter Medication Route"].tap()
		app.textFields["Enter Medication Route"].typeText("By application")
		app.textFields["Frequency"].tap()
		app.textFields["Frequency"].typeText("1")
		app.textFields["Duration"].tap()
		app.textFields["Duration"].typeText("1")
		app.buttons["Prescribe"].tap()
		
		// Show error message if medication already prescribed
		XCTAssert(app.alerts["Cannot Prescribe Duplicate Medications"].isHittable)
		app.alerts["Cannot Prescribe Duplicate Medications"].scrollViews.otherElements.buttons["OK"].tap()
		app.buttons["Cancel"].tap()
    }
}
