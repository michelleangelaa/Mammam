//
//  MotivationSamples.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.
//

import Foundation

extension Motivation {
    static var sampleMotivation: [Motivation] {
        
        
        let motivation1 = Motivation(
            imageStory1: "motivation1image1",
            imageStory2: "motivation1image2",
            imageTrue: "motivation1image3_true",
            imageFalse: "motivation1image3_false",
            quotes: "Guiding Principle in Complementary Feeding: Gradually increase food consistency and variety",
            quotesSource: "World Health Organization",
            adviceImage: ["advice1_motivation1","advice2_motivation1","advice3_motivation1"],
            adviceText: ["Give baby more time and offer the meal again later","You still can offer her to eat maximum until 30 minute","Lack of sleep affects a child's appetite"]
        )
        
        let motivation2 = Motivation(
            imageStory1: "motivation2image1",
            imageStory2: "motivation2image2",
            imageTrue: "motivation2image3_true",
            imageFalse: "motivation2image3_false",
            quotes: "Non-responsive feeding behaviors, such as imposing too many rules, offering rewards, or forcing a child to eat, can lead to overeating and hinder their ability to control portion sizes.",
            quotesSource: "Nutri and Beyond Consultant",
            adviceImage: ["advice1_motivation2","advice2_motivation2","advice3_motivation2"],
            adviceText: ["Don’t assume your child doesn’t like something after only trying it once.","Introduce it 15-20 times with different preparations.","Maintain your child’s trust by being honest about the food you’re serving."]
        )
        
        let motivation3 = Motivation(
            imageStory1: "motivation3image1",
            imageStory2: "motivation3image2",
            imageTrue: "motivation3image3_true",
            imageFalse: "motivation3image3_false",
            quotes: "Social interactions between caregiver and child (such as speaking to the child, singing, and encouraging him/her) also stimulate connections in the child’s brain and promote cognitive development!",
            quotesSource: "World Health Organization",
            adviceImage: ["advice1_motivation3","advice2_motivation3","advice3_motivation3"],
            adviceText: ["Seat your child at the dining table in a calm environment, allowing them to focus on their meal.","Have the mother or other family members eat together with the baby.","Engage with your child by talking and interacting, such as telling them about the food during eat."]
        )
        return [motivation1, motivation2, motivation3]
        
    }
    
}
