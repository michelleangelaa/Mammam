//
//  AddToMealPlanView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 26/12/24.
//

import SwiftUI
import SwiftData

struct AddToMealPlanView: View {
    @Environment(\.dismiss) private var dismiss
       let ingredient: Ingredient
       let date: Date
       var onAddToMealPlan: () -> Void
       
       private var formattedDate: String {
           let formatter = DateFormatter()
           formatter.dateFormat = "EEEE, MMMM d"
           return formatter.string(from: date)
       }
       
       var body: some View {
           VStack(spacing: 0) {
               // Title with date
               Text(formattedDate)
                   .font(.subheadline)
                   .foregroundColor(.secondary)
                   .padding(.top, 24)
               
               // Ingredient Image
               if let imageName = ingredient.image {
                   Image(imageName)
                       .resizable()
                       .scaledToFit()
                       .frame(width: 100, height: 100)
                       .clipShape(Circle())
                       .padding(.vertical, 24)
               }
               
               // Suggestion Title
               Text("How About Trying \(ingredient.name) next ?")
                   .font(.title2)
                   .fontWeight(.bold)
                   .multilineTextAlignment(.center)
                   .padding(.horizontal, 24)
               
               // Description about nutrients
               if let nutrients = ingredient.nutrients, !nutrients.isEmpty {
                   Text("It's rich in \(nutrients.map { $0.name }.joined(separator: ", ")), which is so important for your little one's growth and energy.")
                       .font(.body)
                       .foregroundColor(.secondary)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 24)
                       .padding(.top, 8)
               }
               
               Spacer()
               
               // Action Buttons
               HStack(spacing: 16) {
                   Button(action: {
                       dismiss()
                   }) {
                       Text("No")
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.gray.opacity(0.1))
                           .foregroundColor(.primary)
                           .cornerRadius(12)
                   }
                   
                   Button(action: {
                       onAddToMealPlan()
                       dismiss()
                   }) {
                       Text("Add to meal plan")
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.pink)
                           .foregroundColor(.white)
                           .cornerRadius(12)
                   }
               }
               .padding(.horizontal, 24)
               .padding(.bottom, 32)
           }
           .background(Color.white)
           .cornerRadius(30)
       }
}

//#Preview {
//    // Create a sample ingredient for testing the preview
//    let sampleIngredient = Ingredient(
//        name: "Chicken Liver",
//        image: "chickenLiverImage" // Replace with a valid image asset
////        description: "It's rich in iron, which is so important for your little one's growth and energy."
//    )
//    AddToMealPlanView(ingredient: sampleIngredient)
//}
