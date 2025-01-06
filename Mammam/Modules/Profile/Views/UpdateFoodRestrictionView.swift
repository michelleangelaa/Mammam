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
    @Query private var allergens: [Allergen]
    
    var body: some View {
        VStack {
            Text("Update Food Restriction")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            // Allergens grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                ForEach(allergens) { allergen in
                    let binding = Binding(
                        get: { allergen },
                        set: { newValue in
                            if let index = allergens.firstIndex(where: { $0.id == allergen.id }) {
                                context.insert(newValue)
                            }
                        }
                    )
                    
                    AllergyCardComponent(allergen: binding) { toggledAllergen in
                        updateAllergen(toggledAllergen)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            // Update Button
            Button(action: {
                saveChanges()
                dismiss()
            }) {
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
    }
    
    private func updateAllergen(_ toggledAllergen: Allergen) {
        if let allergen = allergens.first(where: { $0.id == toggledAllergen.id }) {
            // Update the allergen in the database directly
            allergen.isAllergy = toggledAllergen.isAllergy
            allergen.image = toggledAllergen.image
            
            do {
                try context.save()
                print("Successfully updated allergen: \(allergen.name), isAllergy: \(allergen.isAllergy)")
            } catch {
                print("Failed to update allergen: \(error)")
            }
        }
    }
    
    private func saveChanges() {
        do {
            try context.save()
            print("All allergies updated successfully")
        } catch {
            print("Failed to save changes: \(error)")
        }
    }
}

#Preview {
    UpdateFoodRestrictionView()
}
