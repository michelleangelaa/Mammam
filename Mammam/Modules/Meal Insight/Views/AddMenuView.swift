//
//  AddMenuView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 25/12/24.
//

import SwiftUI
import SwiftData

struct AddMenuView: View {
    @Query private var foodMenus: [FoodMenu]
    @State private var offsets: [CGSize] = []
    @State private var currentIndex = 0
    
    var date: Date = Date()
    var recipeTitle: String = "Discover a New Way to Cook Chicken Liver"
    var recipeSubtitle: String = "It's rich in iron, which is so important for your little one's growth and energy."
    
    var body: some View {
        VStack(spacing: 20) {
            // Date
            Text(formattedDate(date))
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 16)
            
            // Title and Subtitle
            VStack(spacing: 8) {
                Text("✨ \(recipeTitle)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(recipeSubtitle)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 24)
            
            // Swipeable Menu Cards
            ZStack {
                ForEach(Array(foodMenus.enumerated()), id: \.element.id) { index, menu in
                    if index >= currentIndex && index < currentIndex + 3 {
                        SwipeableMenuCard(
                            foodMenu: .constant(menu),
                            offset: binding(for: index)
                        )
                        .frame(width: 300, height: 400)
                        .zIndex(Double(foodMenus.count - index))
                    }
                }
            }
            .padding(.vertical, 20)
            
            // Swipe Instruction
            Text("Swipe right to save, left to pass")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 8)
            
            Spacer()
            
            // Done Button
            Button(action: {
                print("Done button tapped")
            }) {
                Text("Done")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 24)
        }
        .padding(.vertical)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .onAppear {
            offsets = Array(repeating: .zero, count: foodMenus.count)
        }
    }
    
    private func binding(for index: Int) -> Binding<CGSize> {
        Binding(
            get: { offsets.indices.contains(index) ? offsets[index] : .zero },
            set: { newValue in
                if offsets.indices.contains(index) {
                    offsets[index] = newValue
                    if abs(newValue.width) > 500 {
                        withAnimation(.spring()) {
                            currentIndex += 1
                        }
                    }
                }
            }
        )
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM dd"
        return formatter.string(from: date).lowercased()
    }
}

#Preview {
    AddMenuView()
        .modelContainer(for: FoodMenu.self)
}
