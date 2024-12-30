////
////  RegisterFormView.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 21/10/24.
////
//
//
//
//import SwiftUI
//import SwiftData
//
//struct RegisterFormView: View {
//    @EnvironmentObject private var coordinator: Coordinator
//    @Environment(\.modelContext) private var context
//    @Environment(\.dismiss) private var dismiss
//    
//    // Passed-in Baby
//    // @State var baby: Baby
//    
//    // Local State for form fields
//    @State private var currentStep = 1
//    private let totalSteps = 3
//    @State private var babyName: String = ""
//    @State private var birthdate = Date()
//    @State private var selectedAllergies: Set<String> = []
//    @State private var isLastStep = false
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            // Progress Indicator
//            indicatorbar(totalCount: totalSteps, currentIndex: currentStep)
//
//            // Content for current step
//            if currentStep == 1 {
//                InputBabyNameView(babyName: $babyName)
//            } else if currentStep == 2 {
//                InputBabyAgeView(birthdate: $birthdate)
//            } else if currentStep == 3 {
//                InputBabyAllergiesView(selectedAllergies: $selectedAllergies)
//            }
//
//            // Navigation Button
//            CustomLargeButtonComponent(
//                state: isFormValid() ? .enabled : .disabled,
//                text: "Continue",
//                action: {
//                    if currentStep < totalSteps {
//                        currentStep += 1
//                    } else {
//                        isLastStep = true
//                        saveBabyData()
//                        coordinator.push(page: .main)
//                    }
//                }
//            )
//            .padding(.horizontal)
//        }
//        .padding()
//    }
//    
//    // Check if form is valid
//    private func isFormValid() -> Bool {
//        switch currentStep {
//        case 1:
//            return !babyName.isEmpty
//        case 2:
//            return birthdate <= Date()
//        case 3:
//            return true
//        default:
//            return false
//        }
//    }
//
// func saveSelectedAllergies(for baby: Baby, selectedAllergies: Set<String>) {
//            let context = container.mainContext
//
//            do {
//                // Fetch the allergens matching the selected names
//                let fetchDescriptor = FetchDescriptor<Allergen>(
//                    predicate: #Predicate { selectedAllergies.contains($0.name) }
//                )
//                let allergens = try context.fetch(fetchDescriptor)
//
//                // Update the baby's allergens
//                baby.allergens = Set(allergens)
//
//                // Save changes to the context
//                try context.save()
//                print("Allergens saved successfully for baby: \(baby.babyName)")
//            } catch {
//                print("Error saving selected allergies: \(error)")
//            }
//    }
//    
//    // Save Baby Data
//    private func saveBabyData() {
//        // Convert selectedAllergies (Set<String>) to [Allergen] for Baby model
////        let allergens = selectedAllergies.map { allergenName -> Allergen in
////            print(selectedAllergies)
////            // Assuming a function or initializer exists to create Allergen objects
////            return Allergen(name: allergenName, image: "placeholderImage")
////        }
//        
////        // Convert selectedAllergies (Set<String>) to [Allergen]
////          let allergens = selectedAllergies.map { allergenName -> Allergen in
////              allergens.name = allergenName
////              allergens.image = "placeholderImage" // Update with actual image if available
////              return allergen
////          }
////        
//        // Create a Baby object
//        let newBaby = Baby(babyProfileImage : "👶🏻", babyName: babyName, babyBirthDate: birthdate)
//       
//        // Save changes
//        context.insert(newBaby)
//        do {
//            try context.save()
//            print("Baby data saved successfully!")
//        } catch {
//            print("Error saving baby data: \(error)")
//        }
//    }
//}
//
//// Supporting Views
//struct InputBabyNameView: View {
//    @Binding var babyName: String
//
//    var body: some View {
//        VStack(spacing: 16) {
//            Text("Baby's Name")
//                .font(.title2)
//                .fontWeight(.bold)
//
//            Text("👶")
//                .font(.system(size: 80))
//
//            TextField("Name", text: $babyName)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(8)
//        }
//        .padding()
//    }
//}
//
//struct InputBabyAgeView: View {
//    @Binding var birthdate: Date
//
//    var body: some View {
//        VStack(spacing: 16) {
//            Text("👶")
//                .font(.system(size: 80))
//
//            Text("Baby's Birthdate")
//                .font(.title2)
//                .fontWeight(.bold)
//
//            DatePicker("", selection: $birthdate, displayedComponents: .date)
//                .datePickerStyle(.wheel)
//                .labelsHidden()
//                .frame(maxWidth: .infinity)
//        }
//        .padding()
//    }
//}
//
//struct InputBabyAllergiesView: View {
//    let allergens: [Allergen] = Allergen.sampleAllergens
//    @Binding var selectedAllergies: Set<String>
//
//    var body: some View {
//        VStack(spacing: 16) {
//            Text("😷")
//                .font(.system(size: 50))
//                .padding(.vertical, 16)
//
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
//                ForEach(allergens, id: \.name) { allergen in
//                    Button(action: {
//                        toggleSelection(for: allergen.name)
//                    }) {
//                        VStack {
//                            Image(allergen.image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 50, height: 50)
//                                .padding()
//                                .background(
//                                    Circle()
//                                        .foregroundColor(selectedAllergies.contains(allergen.name) ? Color.red.opacity(0.2) : Color.gray.opacity(0.2))
//                                )
//                            Text(allergen.name)
//                                .font(.footnote)
//                                .foregroundColor(selectedAllergies.contains(allergen.name) ? .red : .primary)
//                        }
//                        .frame(maxWidth: .infinity)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                }
//            }
//            .padding(16)
//        }
//        .padding()
//    }
//
//    private func toggleSelection(for allergenName: String) {
//        if selectedAllergies.contains(allergenName) {
//            selectedAllergies.remove(allergenName)
//        } else {
//            selectedAllergies.insert(allergenName)
//        }
//    }
//}
//
//// Preview
//#Preview {
//    RegisterFormView()
//        .environmentObject(Coordinator()) // Mock Coordinator if necessary
//}
//
