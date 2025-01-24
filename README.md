# MyHealthApp

Submitted by: **Kelly Bonilla Guzmán**

**MyHealthApp** is a representation of a patients' charts in an Electronic Medical Record system.

## Features

MyHealthApp supports the following functionality:
- Adding a patient and their medical information to the system
- Viewing a list of patients, sorted by last name
- Searching a list of patients by last name
- Viewing patients' medical information and details
- Viewing patients' blood type compatability with other patients for blood transfusions
- Viewing patients' current medications, ordered by date prescribed, exlcuding any completed medications
- Prescribing patients new medications, while avodiing duplicating medications the patient is currently taking

## Demo

---

**MyHealthApp** is a simple data model for representing a patient’s chart
in an Electronic Medical Record system.

## Features

MyHealthApp supports the following functionality:
- Retrieving a patient's full name and age in years (see `Patient.swift`)
- Retrieving a patient's list of medications they are currently taking, ordered
by date prescribed, excluding any completed medications (see `Patient.swift`)
- Prescribing a new medication to a patient, while avoiding duplicating medications the patient is currently taking (see `Patient.swift`)
- Determing which donor blood types a patient can receive a blood transfusion from (see `BloodType.swift`)

## Notes
- My codebase adheres as best as possible to [Google's Swift Style Guide](https://google.github.io/swift/#line-wrapping)
