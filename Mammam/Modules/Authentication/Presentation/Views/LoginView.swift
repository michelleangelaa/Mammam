//
//  LoginView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 01/10/24.
//
//
//import SwiftUI
//
//struct LoginView: View {
//    var body: some View {
////        Image("i_beefporridge")
////            .resizable()
////            .aspectRatio(contentMode: .fill)            .frame(width:363 , height:223)
//        
//        Image(meal.ingredient?.image ?? "leaf") // Placeholder for the meal image
//            .resizable()
//            .frame(width: 70, height: 70)
//            .background(Color(UIColor.systemGray5))
//            .cornerRadius(8)
//        Text("hello world")
//    }
//}
//
//#Preview {
//    LoginView()
//}

//import SwiftUI
//import SwiftData
//
//struct LoginView: View {
//    @Query private var ingredients: [Ingredient]
//    
//    private let columns = [
//        GridItem(.adaptive(minimum: 150), spacing: 16)
//    ]
//    
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 16) {
//                ForEach(ingredients) { ingredient in
//                    IngredientCard(ingredient: ingredient)
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//struct IngredientCard: View {
//    let ingredient: Ingredient
//    
//    var body: some View {
//        VStack {
//            if let imageName = ingredient.image {
//                Image(imageName)
//                    .resizable()
//                                .frame(width: 70, height: 70)
//                                .background(Color(UIColor.systemGray5))
//                                .cornerRadius(8)
//            } else {
//                Image(systemName: "photo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 60, height: 60)
//                    .foregroundColor(.gray)
//                    .frame(width: 120, height: 120)
//                    .background(Color.gray.opacity(0.1))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//            }
//            
//            Text(ingredient.name)
//                .font(.headline)
//                .lineLimit(2)
//                .multilineTextAlignment(.center)
//        }
//        .frame(width: 150, height: 180)
//        .padding()
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(radius: 5)
//    }
//}
//
//#Preview {
//    LoginView()
//        .modelContainer(for: Ingredient.self, inMemory: true)
//}
