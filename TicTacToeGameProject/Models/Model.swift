//
//  Model.swift
//  TicTacToeGameProject
//
//  Created by Rahul Sharma on 3/29/19.
//  Copyright © 2019 jayaram G. All rights reserved.
//

import UIKit

class Model{
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true

    var crossWonText = "Cross has won the game"
    var noughtWonText = "Nought has won the game"
    var drawText = "It was Draw"
    
    var resetGameState = [0,0,0,0,0,0,0,0,0]

    var crossImageView = UIImage(named: "Cross")
    var noughtImageView = UIImage(named: "Nought")
}

