//
//  ViewModel.swift
//  TicTacToeGameProject
//
//  Created by Rahul Sharma on 3/29/19.
//  Copyright © 2019 jayaram G. All rights reserved.
//

import UIKit
class ViewModel {
    var modelObject = Model()

    
    func resettingGame(){
        
        modelObject.gameState = modelObject.resetGameState
        modelObject.gameIsActive = true
        modelObject.activePlayer = 1
        
        
    }
   
}

