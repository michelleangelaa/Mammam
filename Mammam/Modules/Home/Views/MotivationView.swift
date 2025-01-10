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
    @StateObject private var viewModel: MotivationViewModel

    var motivation: Motivation

    init(motivation: Motivation) {
        self.motivation = motivation
        _viewModel = StateObject(wrappedValue: MotivationViewModel(motivation: motivation))
    }

    var body: some View {
        ZStack {
            VStack {
                // Indicator Bar
                indicatorbar(totalCount: 5, currentIndex: viewModel.currentIndicatorBar + 1)
                    .padding(.top, 120)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Conditional Views
                if viewModel.currentIndicatorBar == 4 {
                    quotesView
                } else if viewModel.currentIndicatorBar == 3 {
                    adviceView
                } else {
                    storyView
                }
            }
            .background(Color.black)

            // Exit Button
            exitButton

            // Navigation Buttons
            if viewModel.currentIndicatorBar != 4 {
                nextButton
            } else {
                navigationButtons
            }

            // Question Component
            if viewModel.currentIndicatorBar == 1 {
                questionComponent
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Subviews

    private var quotesView: some View {
        ZStack {
            Color.rose50
                .edgesIgnoringSafeArea(.all)
                .frame(width: 393, height: 852)
                .cornerRadius(20)
                .padding()

            VStack(alignment: .leading, spacing: 19) {
                Text("\"\(viewModel.motivation.quotes)\"")
                    .font(.system(size: 22))
                    .foregroundColor(Color.rose600)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: 335, alignment: .leading)

                HStack(spacing: 14) {
                    Image("i_motivation_quotation")
                    VStack(alignment: .leading) {
                        Text("\(viewModel.motivation.quotesSource)")
                            .font(.system(size: 15, weight: .semibold))
                        Text("Today's Motivation")
                            .font(.system(size: 13))
                    }
                }
            }
            .padding()
            .background(Color.theme.backgroundColor)
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.bottom, 60)
        }
    }

    private var adviceView: some View {
        ZStack {
            Color.rose50
                .edgesIgnoringSafeArea(.all)
                .frame(width: 393, height: 852)
                .cornerRadius(20)
                .padding()

            VStack {
                VStack(alignment: .leading) {
                    if viewModel.resultImage == [viewModel.motivation.imageFalse] {
                        Image("i_motivation_crackheart")
                        Text("\(viewModel.babyName) is sad to hear that 😥")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.97, green: 0, blue: 0))
                    } else {
                        Image("i_motivation_heart")
                        Text("WELL DONE 🎉🎉")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(Color.rose500)
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

                    ForEach(viewModel.getAdviceImages(), id: \.0) { image, text in
                        HStack {
                            Image(image)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(text)
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: 311, alignment: .leading)
                        }
                    }
                }
                .padding()
                .background(Color.theme.backgroundColor)
                .cornerRadius(20)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }

    private var storyView: some View {
        ZStack {
            Color.black
                .frame(width: 393, height: 852)
                .cornerRadius(20)
                .padding()

            if viewModel.activeImages == viewModel.motivation.imageFalse {
                Image(viewModel.motivation.imageFalse)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 393, height: 852)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else if viewModel.activeImages == viewModel.motivation.imageTrue {
                Image(viewModel.motivation.imageTrue)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 393, height: 852)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                let image = viewModel.currentIndicatorBar == 0
                    ? viewModel.motivation.imageStory1
                    : viewModel.motivation.imageStory2
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 393, height: 852)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }

    private var exitButton: some View {
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

    private var nextButton: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.97, green: 0.98, blue: 0.99))
                .frame(width: 55, height: 55)
                .cornerRadius(8)

            Button(action: {
                viewModel.nextPage()
            }) {
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 30)
    }

    private var navigationButtons: some View {
        HStack {
            backButton
            Spacer()
            nextButton
        }
    }

    private var backButton: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.97, green: 0.98, blue: 0.99))
                .frame(width: 55, height: 55)
                .cornerRadius(8)

            Button(action: {
                viewModel.previousPage()
            }) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .position(x: UIScreen.main.bounds.width - 328, y: UIScreen.main.bounds.height - 30)
    }

    private var questionComponent: some View {
        QuestionChoiceComponent(
            buttonText1: viewModel.motivation.buttonText1,
            buttonText2: viewModel.motivation.buttonText2,
            actions: [
                { viewModel.selectOption(false) },
                { viewModel.selectOption(true) }
            ]
        )
        .padding(.top, 600)
    }
}
