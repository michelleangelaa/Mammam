//
//  SavedMenuView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import SwiftData
import SwiftUI

struct SavedMenuView: View {
    @Query var menus: [FoodMenu]
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack {
//            Button("Create Sample Menus") {
//                let newMenus = createSampleMenus(context: context)
//                print("Created \(newMenus.count) menus")
//            }
            Text("Saved Menu")
                .font(.title3)
                .fontWeight(.bold)
            List(menus, id: \.name) { menu in
                HStack {
                    Image(menu.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(menu.name)
                }
            }
        }
    }
}

#Preview {
//    SavedMenuView().modelContainer(for: [Menu.self, Ingredient.self, Nutrient.self, Allergen.self])
}
