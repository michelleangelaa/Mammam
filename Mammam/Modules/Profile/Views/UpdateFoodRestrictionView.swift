//
//  UpdateFoodRestrictionView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 02/01/25.
//

import SwiftUI
import SwiftData

struct UpdateFoodRestrictionView: View {
    @Environment(\.modelContext) private var context
    @Query var allergens: [Allergen]
    
    var body: some View {
        VStack {
            Text("Update Food Restriction")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            // Allergens grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                ForEach(allergens, id: \.self) { allergen in
                    AllergyCard(allergen: allergen)
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
    }
    
    private func updateAllergies() {
        do {
            try context.save() // Save changes to the database
            print("Allergies updated successfully.")
        } catch {
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }
}

struct AllergyCard: View {
    @Environment(\.modelContext) private var context
    @State var allergen: Allergen
    
    var body: some View {
        Button(action: {
            allergen.isAllergy.toggle()
            do {
                try context.save() // Save the toggle change
            } catch {
                print("Error updating allergen: \(error)")
            }
        }) {
            VStack {
                Image(allergen.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                
                Text(allergen.name)
                    .font(.caption)
                    .fontWeight(.bold)
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(allergen.isAllergy ? Color.pink.opacity(0.2) : Color.gray.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(allergen.isAllergy ? Color.pink : Color.gray, lineWidth: 2)
            )
        }
    }
}

#Preview {
    UpdateFoodRestrictionView()
}
