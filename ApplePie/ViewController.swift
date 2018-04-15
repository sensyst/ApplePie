//
//  ViewController.swift
//  ApplePie
//
//  Created by Senthil Dhandapani on 9/4/18.
//  Copyright © 2018 Senthil Dhandapani. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var listOfWords = ["buccaneer", "swift", "glorious",
    "incandescent", "bug", "program"]
    
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
            updateGameState()
            updateUI()
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func newRound(){
        if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed,guessedLetters :[])
            enableLetterButtons(true)
        updateUI()
        }else {
            enableLetterButtons(false)
        }
    
    }
    //Enabling Button after each round
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    // Update UI
    func updateUI(){
        //correctWordLabel.text = currentGame.formatttedWord
        var letters = [String]()
        for letter in currentGame.formatttedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
         scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    //Update the game state
    func updateGameState(){
        if  currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formatttedWord {
            totalWins += 1
        }
        else {
            updateUI()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

