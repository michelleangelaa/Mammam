//
//  MealDetailView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/12/24.
//

import SwiftUI

struct MealDetailView: View {
    let ingredient: Ingredient
    
    var body: some View {
        VStack(spacing: 16) {
            Text(ingredient.name)
                .font(.title)
                .fontWeight(.semibold)
            
            if let ingredientImage = ingredient.image {
                Image(ingredientImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.gray100)
                    .frame(minWidth: 120, minHeight: 120)
            }
            
            Text("Nutrients:")
                .font(.headline)
            
            if let nutrients = ingredient.nutrients {
                ForEach(nutrients, id: \.self) { nutrient in
                    Text(nutrient.name)
                }
            } else {
                Text("No nutrients available.")
            }
            
            Spacer()
        }
        .padding()
        Text("this is meal detail view")
    }
}

#Preview {
    NavigationStack {
        MealDetailView(ingredient: Ingredient.sampleIngredients[1])
    }
}
