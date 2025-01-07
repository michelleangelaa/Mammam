//
//  AllergyCardComponent.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/01/25.
//

import SwiftUI

struct AllergyCardComponent: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var allergen: Allergen
    var onToggle: (Allergen) -> Void
    
    var body: some View {
        Button(action: {
            updateAllergenState()
        }) {
            VStack(spacing: 2) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color(UIColor.systemGray6))
                        .frame(width: 85, height: 85)
                    
                    Image(allergen.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                }
                
                Text(allergen.name)
                    .font(.footnote)
                    .foregroundColor(allergen.isAllergy ? Color.white : Color.black)
                    .padding(.bottom, 10)
            }
            .frame(width: 85, height: 105)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(allergen.isAllergy ? Color.rose.rose600 : Color.gray.gray400)
            )
        }
    }
    
    private func updateAllergenState() {
        // Toggle the allergy state
        allergen.isAllergy.toggle()
        
        // Update the image based on the new state
        let newImage = allergen.isAllergy ?
            allergen.image.replacingOccurrences(of: "_selected", with: "") + "_selected" :
            allergen.image.replacingOccurrences(of: "_selected", with: "")
        
        allergen.image = newImage
        
        // Save changes to the database
        do {
            try modelContext.save()
            print("Successfully updated allergen state: \(allergen.name), isAllergy: \(allergen.isAllergy), image: \(allergen.image)")
        } catch {
            print("Failed to save allergen update: \(error)")
        }
        
        // Call the onToggle callback
        onToggle(allergen)
    }
}

// #Preview {
//    AllergyCardComponent()
// }
