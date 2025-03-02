//
//  ArticleSamples.swift
//  Mammam
//
//  Created by Evelyn Santoso on 30/12/24.
//
import Foundation


extension Article {
    static var sampleArticle: [Article] {
        let article1 = Article(
            previewArticle: "image1article",
            articleTitle: "Introduce new food with food chaining",
            articleImage: "article1Image",
            articleSubheader: ["What is Food Chaining?", "Tips For Success 1", "Tips For Success 2"],
            articleDesc: ["Food chaining is a method that starts with feeding a food a child likes, then using small changes to work toward a new food.","""

            Tips For Success:
            - Have fun and make it a game. Encourage your child to take \"mouse bites,\" \"alligator bites,\" or touch the food with their tongue.
            - Focus on small steps & try one new item at a time. Keep trying!
            - Many children have to try a food more than 10 times before they start to like it.
            """,
            """
            Additional Tips:
            - Minimize distractions while your child is eating. (For example, turn off screens, put pets in another room, etc.)
            - Don't pressure your child; let them decide when they want to stop.
            - Plan meals & snacks ahead of time. Let your child know when to expect a meal or snack.
            """]
        )
        
        let article2 = Article(
            previewArticle: "article2Image",
            articleTitle: "How Long Does Food Chaining Take?",
            articleImage: "article2Image",
            articleSubheader: ["Food chaining doesn’t happen overnight"],
            articleDesc: ["Working on a food chain with your child may take weeks or even months. Remember, it can take 20 or more exposures of a new food before a child may begin to accept it. To put this into perspective – if you have 4 food “links” in your food chain, it might take 4 months to get to then end of your chain – or more! So while we may wish it with all our might, don’t expect a child to go through an entire food chain in a week."]
        )
        
        let article3 = Article(
            previewArticle: "article3Image",
            articleTitle: "How to Implement Food Chainning",
            articleImage: "article3Image",
            articleSubheader: ["1.Make a list of every food your child will eat.","2.Break food down by its sensory profile :", "3.Write food ideas with similar qualities"],
            articleDesc: ["First you need to know what foods your child already accepts. Take some time to think about foods you know they like and will eat. If your child is able to talk, chat with them to see what they like about the foods they do eat. See if there are any common patterns among these foods.", """
                - Color (tan, white, yellow, green, red, etc.). 
                - Texture (crunchy, soft, hard, sticky, squishy, etc.).
                - Temperature (warm, cold, room temp, etc.). 
                - Shape (oval, stick, circle, etc.).
                """, "Think of foods similar in taste, texture, smell, temperature, or color to those your child prefers. If they have more than one similarity, even better. Try not to limit yourself here. Write down as many ideas as you can think of – including foods you think your child would never eat."]
        )
        return [article1, article2, article3]
    }
}

