//
//  ArticleView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import SwiftUI

struct ArticleView: View {
    @Environment(\.dismiss) var dismiss // Access dismiss environment
    
    //prefdefined content
    let title = ["Introduce new food with food chaining"]
      let headerarticle = ["What is Food Chaining?", "Tips For Success 1", "Tips For Success 2"]
    let detailarticle  = ["Food chaining is a method that starts with feeding a food a child likes, then using small changes to work toward a new food.", """
               - Have fun and make it a game. Encourage your child to take "mouse bites," "alligator bites," or touch the food with their tongue.
               - Focus on small steps & try one new item at a time. Keep trying!
               - Many children have to try a food more than 10 times before they start to like it.
               """, """
                - Minimize distractions while your child is eating. (For example, turn off screens, put pets in another room, etc.)
                - Don't pressure your child; let them decide when they want to stop.
                - Plan meals & snacks ahead of time. Let your child know when to expect a meal or snack.
                """]
   
    var body: some View {
     
        NavigationStack {
            ScrollView {
            
                    VStack(alignment: .center) {
                        Text("Introduce new food with food chaining")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.top, 20)
                        
                        Image("motivationimage1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 315, height: 200)
                            .cornerRadius(10)
                            
                        // Articles Section
                            ForEach(headerarticle.indices, id: \.self) { index in
                                        VStack(alignment: .leading, spacing: 12) {
                                                    Text(headerarticle[index])
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                   
                                                    
                                                    Text(detailarticle[index])
                                                        .font(.system(size: 12))
                                                        
                                                }
                                                .padding()
                                                .background(Color(.systemGray6))
                                                .cornerRadius(10)
                                                .frame(maxWidth: .infinity)
                            }.padding(.bottom,12)
                        
                    }.padding(20)
                    
              
                
            } .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ArticleView()
}



