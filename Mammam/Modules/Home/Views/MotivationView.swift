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

    var motivation: Motivation
    
    @State private var currentImageIndex = 0 // Tracks the current image index
    @State private var currentIndicatorBar = 0

    @State private var navigateToHome = false
    @State private var closetohome = false
    @State private var resultImage : [String] = []
    @State private var activeImages = ""
    

var body: some View {
            ZStack {
                
                VStack {
                    // Custom Indicator Bar
                    indicatorbar(totalCount: 5, currentIndex: currentIndicatorBar + 1)
                  
                        .padding(.top, 120)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Conditional views between page result,quotes and page story
                    if currentIndicatorBar == 4 {
                        ZStack {
                            Color.rose50
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: 393, height: 852, alignment: .topLeading)
                                .cornerRadius(20)
                                .padding()

                            VStack(alignment: .leading, spacing: 19) {
                                Text("\"\(motivation.quotes)\"")
                                    .font(.system(size: 22))
                                    .foregroundColor(Color.rose600)

                                HStack(spacing: 14) {
                                    Image("i_motivation_quotation")
                                    VStack(alignment: .leading) {
                                        Text("\(motivation.quotesSource)")
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
                                    if resultImage == [motivation.imageFalse] {
                                        Image("i_motivation_crackheart")
//                                        Text("\(currentUser.fullname) sad to hear that 😥")
                                        Text("eve sad to hear that 😥")
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
                                    
                                    ForEach(0..<motivation.imageAdvice.count, id: \.self) { index in
                                            HStack {
                    
                                                Image(motivation.imageAdvice[index])
                                                    .resizable()
                                                    .frame(width: 50, height: 50) // Example size
                                                Text(motivation.tips[index])
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

                            if  activeImages == motivation.imageFalse {
                                Image(motivation.imageFalse)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 393, height: 852, alignment: .topLeading)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }else if activeImages == motivation.imageTrue{
                                Image(motivation.imageTrue)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 393, height: 852, alignment: .topLeading)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }else{
                                Image(motivation.imageStory1[currentImageIndex])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 393, height: 852, alignment: .topLeading)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
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
                                    activeImages = motivation.imageFalse
                                    currentImageIndex = 0
                                    currentIndicatorBar += 1
                                },
                                {
                                    activeImages = motivation.imageTrue
                                    currentImageIndex = 0
                                    currentIndicatorBar += 1
                                }
                            ]
                        ).padding(.top, 600) // Position QuestionChoiceComponent
                    }
                }
            }        .navigationBarBackButtonHidden(true) // Hide the back button


    }
}
          


extension Motivation {
    static var sampleMotivation: Motivation {
        
        
            Motivation(
                imageStory1: ["motivationimage1","motivationimage2"],
                imageTrue: "motivationimage3_true",
                imageFalse: "motivationimage3_false",
                imageAdvice: ["i_motivation_advice1","i_motivation_advice2"],
                quotes: "It's okay if your child rejects food today, keep offering it in different forms. Consistency is key!",
                quotesSource: "WHO",
                tips: ["- Give baby more time and offer the meal again later.","- You still can offer her to eat for a maximum of 30 minutes."]
            )
        
        
    }
}

#Preview {
    MotivationView(motivation: Motivation.sampleMotivation)
}


