//
//  SavedMenuView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import SwiftData
import SwiftUI

struct SavedMenuView: View {
    @Query(filter: #Predicate<FoodMenu> { menu in
        menu.isSaved == true
    }) private var savedMenus: [FoodMenu]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Saved Menu")
                    .font(.title3)
                    .fontWeight(.bold)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(savedMenus) { menu in
                        FoodMenuCardComponent(foodMenu: .constant(menu))
                    }
                }
            }
        }
    }
}

#Preview {
    SavedMenuView().modelContainer(for: FoodMenu.self)
}

//#Preview {
//    let previewContext = try! ModelContainer(for: FoodMenu.self)
//    return SavedMenuView()
//        .environment(\.modelContext, previewContext)
//}
