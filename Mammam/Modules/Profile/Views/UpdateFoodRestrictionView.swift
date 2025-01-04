//
//  UpdateFoodRestrictionView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 02/01/25.
//

import SwiftData
import SwiftUI

struct UpdateFoodRestrictionView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query var allergens: [Allergen]
    @State private var localAllergens: [Allergen] = []

    var body: some View {
        VStack {
            Text("Update Food Restriction")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            // Allergens grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                ForEach(localAllergens, id: \.self) { allergen in
                    AllergyCardComponent(allergen: allergen) { toggledAllergen in
                        if let index = localAllergens.firstIndex(where: { $0.name == toggledAllergen.name }) {
                            localAllergens[index] = toggledAllergen
                        }
                    }
                }
            }
            .padding()

            Spacer()

            // Update Button
            Button(action: updateAllergies) {
                Text("Update Baby's Allergies")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding(.horizontal)
        .onAppear {
            // Initialize the localAllergens array with a copy of allergens
            localAllergens = allergens.map { allergen in
                Allergen(name: allergen.name, image: allergen.image, isAllergy: allergen.isAllergy)
            }
        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button("Back") {
//                    // Dismiss without saving changes
//                    dismiss()
//                }
//            }
//        }
    }

    private func updateAllergies() {
        // Save changes to the actual allergens in the database
        for allergen in localAllergens {
            if let original = allergens.first(where: { $0.name == allergen.name }) {
                original.isAllergy = allergen.isAllergy
            }
        }

        do {
            try context.save() // Save changes to the database
            print("Allergies updated successfully.")
            dismiss()
        } catch {
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }
}


#Preview {
    UpdateFoodRestrictionView()
}
