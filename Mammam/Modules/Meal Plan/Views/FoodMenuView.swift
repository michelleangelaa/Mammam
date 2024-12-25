//
//  FoodMenuView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 22/12/24.
//

import SwiftData
import SwiftUI

struct FoodMenuView: View {
    @Environment(\.modelContext) private var context
    @Query private var foodMenus: [FoodMenu]

    var body: some View {
        Text("all menu")
        NavigationStack {
            if foodMenus.isEmpty {
                Text("is empty")
            } else {
                ForEach(foodMenus, id: \.self) { food in
                    FoodMenuCardComponent(foodMenu: food)
                }
            }
        }
        .navigationTitle("Menu")

    }
}
    
//struct FoodMenuCard: View {
//    var foodMenu: FoodMenu
//    
//    var body: some View {
//        VStack {
//            Image(foodMenu.image)
//                .resizable()
//                .scaledToFit()
//            Text(foodMenu.name)
//        }
//    }
//}

 #Preview {
     FoodMenuView()
 }
