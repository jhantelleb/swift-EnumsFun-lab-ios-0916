//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!

    var player1Score = 0
    var opponentScore = 0
    
    @IBAction func flipCard(_ sender: UIButton) {
        playerCardLabel.text = "Player 1"
        opponentCardLabel.text = "Player 2"
        let gameEngine = GameEngine(player1: playerCardLabel.text!, player2: opponentCardLabel.text! )
        winnerLabel.text = gameEngine.playOneTurn().0.name + " wins!"
        playerCardLabel.text = gameEngine.playOneTurn().1?.description
        opponentCardLabel.text = gameEngine.playOneTurn().2?.description
        
        if gameEngine.playOneTurn().0.name == gameEngine.player1.name {
            player1Score += 1
            playerScoreLabel.text = ("You:" + String(player1Score))
        } else if gameEngine.playOneTurn().0.name == gameEngine.player2.name {
           opponentScore += 1
           opponentScoreLabel.text = ("Opponent:" + String(opponentScore)) }
    }
}
