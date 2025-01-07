//
//  MotivationView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import SwiftData
import SwiftUI

struct MotivationView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var motivation: Motivation
    @Query private var babies: [Baby]

    @State private var currentImageIndex = 0 // Tracks the current image index
    @State private var currentIndicatorBar = 0

    @State private var navigateToHome = false
    @State private var closetohome = false
    @State private var resultImage: [String] = []
    @State private var activeImages = ""

    init(motivation: Motivation) {
        self.motivation = motivation
        print("MotivationView initialized with buttons: \(motivation.buttonText1), \(motivation.buttonText2)")
    }

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
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil) // Allow unlimited lines
                                .fixedSize(horizontal: false, vertical: true) // Ensure the text resizes vertically
                                .frame(maxWidth: 335, alignment: .leading) // Ensure proper alignment

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
//                        .frame(width: 335, height: 225)
                        .background(
                            Color.theme.backgroundColor // Background for VStack
                        )
                        .cornerRadius(20)
                        .padding(.horizontal)
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
                                if resultImage == [motivation.imageFalse] {
                                    Image("i_motivation_crackheart")
                                    Text("\(babies.first?.babyName ?? "Your child") is sad to hear that 😥")
                                        .font(.system(size: 28))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.97, green: 0, blue: 0))
//                                        .frame(maxWidth: .infinity, alignment: .leading) // Align consistently
                                } else {
                                    Image("i_motivation_heart")
                                    Text("WELL DONE 🎉🎉")
                                        .font(.system(size: 28))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.rose500)
//                                        .frame(maxWidth: .infinity, alignment: .leading) // Align consistently
                                }
                            }
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

                                ForEach(0 ..< motivation.adviceImage.count, id: \.self) { index in
                                    HStack {
                                        Image(motivation.adviceImage[index])
                                            .resizable()
                                            .frame(width: 50, height: 50) // Example size
                                        Text(motivation.adviceText[index])
                                            .font(.system(size: 13))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(nil) // Allow unlimited lines
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(maxWidth: 311, alignment: .leading) // Ensure proper alignment

                                    }
                                }
                            }
                            .padding()
//                                .frame(width: 311, height: 216)
                            .background(
                                Color.theme.backgroundColor // Background for VStack
                            )
                            .cornerRadius(20)

                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }

                } else {
                    ZStack {
                        // Align with the same structure
                        Color.black // Optional background for consistency
                            .frame(width: 393, height: 852, alignment: .topLeading)
                            .cornerRadius(20)
                            .padding()

                        if activeImages == motivation.imageFalse {
                            Image(motivation.imageFalse)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 393, height: 852, alignment: .topLeading)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        } else if activeImages == motivation.imageTrue {
                            Image(motivation.imageTrue)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 393, height: 852, alignment: .topLeading)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        } else {
                            Image(motivation.imageStory1)
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
                    .padding(.leading, 16)
                    .navigationDestination(isPresented: $closetohome) {
                        HomeView()
                            .navigationBarBackButtonHidden(true)
                    }

                    Spacer()
                }
            }

            // Content on image
            if currentImageIndex == 0 || currentIndicatorBar == 3 {
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

            } else if currentIndicatorBar == 4 {
                // Next Button
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.97, green: 0.98, blue: 0.99)) // Optional background
                        .frame(width: 55, height: 55)
                        .cornerRadius(8)

                    Button(action: {
                        navigateToHome = true
                        coordinator.push(page: .main)

                    }) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 30)

                // back button
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
                        buttonText1: motivation.buttonText1, // Make sure these values are not empty
                        buttonText2: motivation.buttonText2,
                        actions: [
                            { // User chooses first option
                                activeImages = motivation.imageFalse
                                currentImageIndex = 0
                                currentIndicatorBar += 1
                                resultImage = [motivation.imageFalse] // Store the result
                            },
                            { // User chooses second option
                                activeImages = motivation.imageTrue
                                currentImageIndex = 0
                                currentIndicatorBar += 1
                                resultImage = [motivation.imageTrue] // Store the result
                            }
                        ]
                    ).padding(.top, 600) // Position QuestionChoiceComponent
                }
            }
        }.navigationBarBackButtonHidden(true) // Hide the back button
    }
}

extension Motivation {
    static var sampleMotivation: Motivation {
        Motivation(
            previewMotivation: "home_motivation2",
            imageStory1: "motivation2image1",
            imageStory2: "motivation2image2",
            imageTrue: "motivation2image3_true",
            imageFalse: "motivation2image3_false",
            buttonText1: "Hide the carrot under rice",
            buttonText2: "Prepare a different carrot-based dish",
            quotes: "Non-responsive feeding behaviors, such as imposing too many rules, offering rewards, or forcing a child to eat, can lead to overeating and hinder their ability to control portion sizes.",
            quotesSource: "Nutri and Beyond Consultant",
            adviceImage: ["advice1_motivation2", "advice2_motivation2", "advice3_motivation2"],
            adviceText: ["Don’t assume your child doesn’t like something after only trying it once.", "Introduce it 15-20 times with different preparations.", "Maintain your child’s trust by being honest about the food you’re serving."]
        )
    }
}

// #Preview {
//    MotivationView(motivation: Motivation.sampleMotivation)
// }
//
