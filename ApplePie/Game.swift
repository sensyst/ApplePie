//
//  Game.swift
//  ApplePie
//
//  Created by Senthil Dhandapani on 9/4/18.
//  Copyright © 2018 Senthil Dhandapani. All rights reserved.
//

import Foundation
struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters:[Character]
    
    var formatttedWord : String{
        var guessedWord = ""
        for idx in word{
            if guessedLetters.contains(idx){
                guessedWord += "\(idx)"
            }
            else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter : Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
    
}

