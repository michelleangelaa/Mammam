//
//  indicatorbar.swift
//  Mammam
//
//  Created by Evelyn Santoso on 05/12/24.
//

import SwiftUI

struct CustomIndicatorbar: View {
    let totalCount: Int // Total number of indicators
    let currentIndex: Int // Current active index (0-based)
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                ForEach(0..<totalCount, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 5)
                        .fill(colorForIndex(index))
                        .frame(height: 5)
                }
            }
            .padding(.bottom, 4)
            
//            Text("\(currentIndex) of \(totalCount)")
//                .font(.system(size: 16, weight: .medium))
//                .foregroundStyle(Color.black)
        }
        .padding(.horizontal, 25)
        
    }
    
    private func colorForIndex(_ index: Int) -> Color {
        if index < currentIndex {
            return Color.rose.rose600
        } else {
            return Color.gray.gray300
        }
    }
}

#Preview {
    VStack {
        CustomIndicatorbar(totalCount: 5, currentIndex: 1)
    }
}
