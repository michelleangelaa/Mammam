//
//  MotivationView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//
import SwiftUI
import SwiftData

struct MotivationView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var currentImageIndex = 0
    @State private var currentIndicatorBar = 0
    @State private var activeImages: [String] = []
    @State private var navigateToHome = false
    @State private var closetohome = false
    
    // Motivation data from model
//    var motivation: Motivation

    var body: some View {
        ZStack {
            VStack {
                indicatorbar(totalCount: 5, currentIndex: currentIndicatorBar + 1)
                    .padding(.top, 120)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if currentIndicatorBar == 4 {
                    ZStack {
                        Color.rose50
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 393, height: 852, alignment: .topLeading)
                            .cornerRadius(20)
                            .padding()
//                        
//                        VStack(alignment: .leading, spacing: 19) {
//                            Text("\"\(motivation.quotes[0])\"")
//                                .font(.system(size: 22))
//                                .foregroundColor(Color.rose600)
//                            
//                            HStack(spacing: 14) {
//                                Image("i_motivation_quotation")
//                                VStack(alignment: .leading) {
//                                    Text("\(motivation.tips[0])")
//                                        .font(.system(size: 15, weight: .semibold))
//                                    Text("Today's Motivation")
//                                        .font(.system(size: 13))
//                                }
//                            }
//                        }
                        .padding()
                        .frame(width: 335, height: 225)
                        .background(Color.theme.backgroundColor)
                        .cornerRadius(20)
                        .padding(.bottom, 60)
                    }
                } else if currentIndicatorBar == 3 {
                    ZStack {
                        Color.rose50
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 393, height: 852, alignment: .topLeading)
                            .cornerRadius(20)
                            .padding()
                        
                        VStack {
                            VStack(alignment: .leading) {
//                                if activeImages == [motivation.imageFalse] {
//                                    Image("i_motivation_heart")
//                                    Text("WELL DONE 🎉🎉")
//                                        .font(.system(size: 28))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color.rose500)
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                } else {
//                                    Image("i_motivation_crackheart")
//                                    Text("eve sad to hear that 😥")
//                                        .font(.system(size: 28))
//                                        .fontWeight(.bold)
//                                        .foregroundColor(Color(red: 0.97, green: 0, blue: 0))
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                }
                            }
                            .padding(.leading, 55)
                            .padding(.bottom, 30)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Spacer()
                                    Image("i_motivation_blinkleft")
                                    Text("The Better Way to Respond")
                                        .font(.system(size: 17))
                                        .fontWeight(.semibold)
                                    Image("i_motivation_blinkright")
                                    Spacer()
                                }
                                
//                                ForEach(0..<motivation.adviceImages.count, id: \.self) { index in
//                                    HStack {
//                                        Image(motivation.adviceImages[index])
//                                            .resizable()
//                                            .frame(width: 50, height: 50)
//                                        Text(motivation.adviceTexts[index])
//                                            .font(.system(size: 13))
//                                            .fontWeight(.semibold)
//                                    }
//                                    .padding(.vertical, 2)
//                                    .padding(.horizontal, 12)
//                                }
                            }
                            .padding()
                            .frame(width: 311, height: 216)
                            .background(Color.theme.backgroundColor)
                            .cornerRadius(20)
                        }
                        .padding(.bottom, 20)
                    }
                } else {
                    ZStack {
                        Color.black
                            .frame(width: 393, height: 852, alignment: .topLeading)
                            .cornerRadius(20)
                            .padding()
                        
                        Image(activeImages[currentImageIndex])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 393, height: 852, alignment: .topLeading)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
            }
            .background(Color.black)

            // Exit "X" Button on the top-left
            ZStack {
                HStack {
                    Button(action: {
                        coordinator.push(page: .main)
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.rose600)
                            .background(Color.white.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .padding()
                    .padding(.bottom, 660)
                    .padding(.leading, 16)
                    
                    Spacer()
                }
            }

            // Next Button
            if currentIndicatorBar < 4 {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.97, green: 0.98, blue: 0.99))
                        .frame(width: 55, height: 55)
                        .cornerRadius(8)
                    
                    Button(action: {
                        currentImageIndex += 1
                        currentIndicatorBar += 1
                    }) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 30)
            } else {
                // Final navigation to HomeView
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.97, green: 0.98, blue: 0.99))
                        .frame(width: 55, height: 55)
                        .cornerRadius(8)
                    
                    Button(action: {
                        navigateToHome = true
                    }) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 30)
                
                // Navigation to HomeView
                .navigationDestination(isPresented: $navigateToHome) {
                    MainView()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}


//extension Motivation {
//    static var sampleMotivation: Motivation {
//        
//        
//            Motivation(
//                imageStory1: "motivationimage1",
//                imageStory2: "motivationimage2",
//                imageTrue: "motivationimage3_true",
//                imageFalse: "motivationimage3_false",
//                quotes: "It's okay if your child rejects food today, keep offering it in different forms. Consistency is key!",
//                tips: """
//                    - Give baby more time and offer the meal again later.
//                    - You still can offer her to eat for a maximum of 30 minutes.
//                    """
//            )
//        
//        
//    }
//}
//
//#Preview {
//    MotivationView(motivatioin: Motivation.sampleMotivation)
//}
//
