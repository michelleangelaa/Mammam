//
//  MotivationViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 10/01/25.
//

import SwiftUI

class MotivationViewModel: ObservableObject {
    @Published var currentImageIndex = 0
    @Published var currentIndicatorBar = 0
    @Published var activeImages = ""
    @Published var resultImage: [String] = []
    @Published var navigateToHome = false

    var babyName: String = "Your child"
    let motivation: Motivation

    init(motivation: Motivation) {
        self.motivation = motivation
    }

    func setBabyName(_ name: String) {
        babyName = name
    }

    func nextPage() {
        currentImageIndex += 1
        currentIndicatorBar += 1
    }

    func previousPage() {
        currentImageIndex -= 1
        currentIndicatorBar -= 1
    }

    func selectOption(_ isTrueOption: Bool) {
        activeImages = isTrueOption ? motivation.imageTrue : motivation.imageFalse
        resultImage = [activeImages]
        nextPage()
    }

    func getAdviceImages() -> [(String, String)] {
        return zip(motivation.adviceImage, motivation.adviceText).map { ($0, $1) }
    }
}
