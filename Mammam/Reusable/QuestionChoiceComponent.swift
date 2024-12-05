//
//  QuestionChoiceComponent.swift
//  Mammam
//
//  Created by Evelyn Santoso on 05/12/24.
//

import SwiftUI

struct QuestionChoiceComponent: View {
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading){
                Rectangle()
                    .fill(Color.theme.backgroundColor)
                    .cornerRadius(20)
                    .frame(width: 361, height: 185)
                
                Text("What Should I Do?")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.theme.primaryTextColor)
                    .padding([.top, .leading], 19)
                
                VStack(spacing: 14) {
                    CustomMediumButtonComponent(state: .enabled, text: "Get Mad") {
                        //action function
                    }
                    
                    CustomMediumButtonComponent(state: .enabled, text: "encourage the kid") {
                        //action function
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 56)
            }.frame(width: 361, height: 185)
        }
               
    }
}

#Preview {
    QuestionChoiceComponent()
}

