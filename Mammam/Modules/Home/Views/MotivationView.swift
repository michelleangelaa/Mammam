//
//  MotivationView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import SwiftUI

struct MotivationView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var currentImageIndex = 0 // Tracks the current image index
    @State private var currentIndicatorBar = 0
    @State private var activeImages: [String] = ["motivationimage1", "motivationimage2"] // Initial images array
    @State private var navigateToHome = false
    @State private var closetohome = false
    
    //user data
    let currentUser = User(id: "1", fullname: "Eve", email: "eve@example.com", username: "eve123", profileImageUrl: nil)

    
    //predefined sets of quotes and advice page
    private let quotes = [
            "It's okay if your child rejects food today, keep offering it in different forms. Consistency is key!."
        ]
    private let quotesWriter = ["World Health Organization"]
    private let adviceTexts = ["Give baby more time and offer the meal again later","You still can offer her to eat maximum until 30 minute2"]


    // Predefined sets of images
    private let images = ["motivationimage1", "motivationimage2"]
    private let images_false = ["motivationimage3_false"]
    private let images_true = ["motivationimage3_true"]
    private let adviceImages = ["i_motivation_advice1","i_motivation_advice2"]


var body: some View {
//    NavigationStack {
            ZStack {
                
                VStack {
                    // Custom Indicator Bar
                    indicatorbar(totalCount: 5, currentIndex: currentIndicatorBar + 1)
                  
                        .padding(.top, 120)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Conditional views
                    if currentIndicatorBar == 4 {
                        ZStack {
                            Color.rose50
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: 393, height: 852, alignment: .topLeading)
                                .cornerRadius(20)
                                .padding()

                            VStack(alignment: .leading, spacing: 19) {
                                Text("\"\(quotes[0])\"")
                                    .font(.system(size: 22))
                                    .foregroundColor(Color.rose600)

                                HStack(spacing: 14) {
                                    Image("i_motivation_quotation")
                                    VStack(alignment: .leading) {
                                        Text("\(quotesWriter[0])")
                                            .font(.system(size: 15, weight: .semibold))
                                        Text("Today's Motivation")
                                            .font(.system(size: 13))
                                    }
                                }
                            }
                            .padding()
                            .frame(width: 335, height: 225)
                            .background(
                                Color.theme.backgroundColor // Background for VStack
                            )
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
                            
                            VStack{
                                VStack(alignment: .leading) {
                                    if activeImages == images_false {
                                        Image("i_motivation_crackheart")
                                        Text("\(currentUser.fullname) sad to hear that 😥")
                                            .font(.system(size: 28))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(red: 0.97, green: 0, blue: 0))
                                            .frame(maxWidth: .infinity, alignment: .leading) // Align consistently
                                    } else {
                                        Image("i_motivation_heart")
                                        Text("WELL DONE 🎉🎉")
                                            .font(.system(size: 28))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.rose500)
                                            .frame(maxWidth: .infinity, alignment: .leading) // Align consistently
                                    }
                                }
                                .padding(.leading, 55)
                                .padding(.bottom, 30)

                            
                                VStack(alignment: .leading,spacing: 12){
                                    
                                    HStack(){
                                        Spacer()
                                        Image("i_motivation_blinkleft")
                                        Text("The Better Way to Respond")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                        Image("i_motivation_blinkright")
                                        Spacer()
                                    }
                                    
                                    ForEach(0..<adviceImages.count, id: \.self) { index in
                                            HStack {
                    
                                                Image(adviceImages[index])
                                                    .resizable()
                                                    .frame(width: 50, height: 50) // Example size
                                                Text(adviceTexts[index])
                                                    .font(.system(size: 13))
                                                    .fontWeight(.semibold)
                                            }.padding(.vertical,2)
                                            .padding(.horizontal,12)
                                            
                                    }
                                }.padding()
                                .frame(width: 311, height: 216)
                                .background(
                                        Color.theme.backgroundColor // Background for VStack
                                )
                                .cornerRadius(20)
                              
                                
                            }.padding(.bottom,20)
                        }
                        
                    }else {
                        ZStack {
                            // Align with the same structure
                            Color.black // Optional background for consistency
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
                              //  closetohome = true // Navigate to HomeView
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
                            .padding(.leading,16)
                            
                            .navigationDestination(isPresented: $closetohome) {
                                HomeView()
                                    .navigationBarBackButtonHidden(true)
                            }
                            

                            Spacer()
                        }

                    }


               
                // Content on image
                if currentImageIndex == 0 || currentIndicatorBar == 3  {

                    // Next Button
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 0.97, green: 0.98, blue: 0.99)) // Optional background
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

                }else if currentIndicatorBar == 4{
                    // Next Button
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 0.97, green: 0.98, blue: 0.99)) // Optional background
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
                        .navigationDestination(isPresented: $navigateToHome) {
                            MainView()
                                .navigationBarBackButtonHidden(true)
                        }

                    }
                    .padding()
                    .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 30)

                    //back button
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 0.97, green: 0.98, blue: 0.99)) // Optional background
                            .frame(width: 55, height: 55)
                            .cornerRadius(8)

                        Button(action: {
                            currentImageIndex -= 1
                            currentIndicatorBar -= 1

                        }) {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }

                    }
                    .padding()
                    .position(x: UIScreen.main.bounds.width - 328, y: UIScreen.main.bounds.height - 30)

                } else if currentIndicatorBar == 1 {

                    // Display second image with the QuestionChoiceComponent
                    ZStack {
                        QuestionChoiceComponent(
                            buttonText1: "Get Mad",
                            buttonText2: "Encourage the Kid",
                            actions: [
                                {   // User chooses "Get Mad"
                                    activeImages = images_false
                                    currentImageIndex = 0
                                    currentIndicatorBar += 1
                                },
                                {
                                    activeImages = images_true
                                    currentImageIndex = 0
                                    currentIndicatorBar += 1
                                }
                            ]
                        ).padding(.top, 600) // Position QuestionChoiceComponent
                    }
                }
            }        .navigationBarBackButtonHidden(true) // Hide the back button

//        }


    }
}
          
 

#Preview {
    MotivationView()
}

