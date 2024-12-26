//
//  SwipeableMenuCard.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 26/12/24.
//

import SwiftUI

struct SwipeableMenuCard: View {
    @Binding var foodMenu: FoodMenu
    @Binding var offset: CGSize
    @Environment(\.modelContext) private var context
    
    var body: some View {
        FoodMenuCardComponent(foodMenu: $foodMenu)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        let translation = gesture.translation
                        // Limit vertical movement
                        offset = CGSize(width: translation.width, height: min(abs(translation.width) * 0.2, translation.height))
                    }
                    .onEnded { gesture in
                        let swipeThreshold: CGFloat = 150
                        withAnimation(.spring()) {
                            if gesture.translation.width > swipeThreshold {
                                // Swipe right - Save
                                offset = CGSize(width: 500, height: 0)
                                foodMenu.isSaved = true
                            } else if gesture.translation.width < -swipeThreshold {
                                // Swipe left - Unsave
                                offset = CGSize(width: -500, height: 0)
                                foodMenu.isSaved = false
                            } else {
                                // Reset position
                                offset = .zero
                            }
                            try? context.save()
                        }
                    }
            )
            .rotationEffect(.degrees(Double(offset.width / 20)))
            .animation(.interactiveSpring(), value: offset)
    }
}

//#Preview {
//    SwipeableMenuCard()
//}
