//
//  Flashcards.swift
//  FlashcardGame
//
//  Created by iD Student on 8/2/17.
//  Copyright © 2017 iDTech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    init(question : String, options : [String]) {
        self.question = question
        self.options = options
    
        self.correctAnswer = options[0]
    }
}

class CardCollection {
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    
    private init(){
        
        cards = [ Flashcard(question: "Test Question", options: ["True", "False"]),
                  Flashcard(question: "What is the capitol of california?", options: ["Sacramento", "Los Angeles", "San Diego", "San Francisco"]), Flashcard(question: "What is the most populated country in the world?", options: ["China", "USA", "Russia", "United Kingdom"])]
        
        currentIndex = 0
    }
    
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count) {
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
