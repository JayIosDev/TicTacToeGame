//
//  ViewController.swift
//  TicTacToeGameProject
//
//  Created by Rahul Sharma on 3/29/19.
//  Copyright © 2019 jayaram G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModelObject = ViewModel()
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var playAgainOutlet: UIButton!
    
    @IBOutlet weak var viewOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        settingBtnOutlets()
    }

    func settingBtnOutlets(){
        btn1.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderColor = UIColor.black.cgColor
        btn3.layer.borderColor = UIColor.black.cgColor
        btn4.layer.borderColor = UIColor.black.cgColor
        btn5.layer.borderColor = UIColor.black.cgColor
        btn6.layer.borderColor = UIColor.black.cgColor
        btn7.layer.borderColor = UIColor.black.cgColor
        btn8.layer.borderColor = UIColor.black.cgColor
        btn9.layer.borderColor = UIColor.black.cgColor
        
        
        btn1.layer.borderWidth = 2.0
        btn2.layer.borderWidth = 2.0
        btn3.layer.borderWidth = 2.0
        btn4.layer.borderWidth = 2.0
        btn5.layer.borderWidth = 2.0
        btn6.layer.borderWidth = 2.0
        btn7.layer.borderWidth = 2.0
        btn8.layer.borderWidth = 2.0
        btn9.layer.borderWidth = 2.0
        
        
    }
    
    // start play
    @IBAction func action(_ sender: UIButton) {
        
        // checking game state
    if (viewModelObject.modelObject.gameState[sender.tag-1] == 0){
            
        viewModelObject.modelObject.gameState[sender.tag-1] = viewModelObject.modelObject.activePlayer
        if viewModelObject.modelObject.activePlayer == 1{
            sender.setImage(viewModelObject.modelObject.crossImageView, for: UIControl.State())
                viewModelObject.modelObject.activePlayer = 2
            }else{
                sender.setImage(viewModelObject.modelObject.noughtImageView, for: UIControl.State())
                viewModelObject.modelObject.activePlayer = 1
            }
        }
        for combination in viewModelObject.modelObject.winningCombinations{
            print(viewModelObject.modelObject.winningCombinations)
            if  viewModelObject.modelObject.gameState[combination[0]] != 0 && viewModelObject.modelObject.gameState[combination[0]] == viewModelObject.modelObject.gameState[combination[1]] && viewModelObject.modelObject.gameState[combination[1]] == viewModelObject.modelObject.gameState[combination[2]]{

                viewModelObject.modelObject.gameIsActive = false
                print(viewModelObject.modelObject.gameState[combination[0]])
                
                if viewModelObject.modelObject.gameState[combination[0]] == 1{
                    print("Crosses Won")
                    
                    viewOutlet.isUserInteractionEnabled = false
                    wonLabel.text  = viewModelObject.modelObject.crossWonText
                }else  if viewModelObject.modelObject.gameState[combination[1]] == 2{
                    viewOutlet.isUserInteractionEnabled = false

                    wonLabel.text = viewModelObject.modelObject.noughtWonText
                }
                
                wonLabel.isHidden = false
                playAgainOutlet.isHidden = false
           // something
                
            }
        }
        
        viewModelObject.modelObject.gameIsActive = false
        
        
        for i in viewModelObject.modelObject.gameState{
            
            if i == 0 {
                viewModelObject.modelObject.gameIsActive = true
                break
            }
        }
     
        if viewModelObject.modelObject.gameIsActive == false {
            if wonLabel.isHidden {
                wonLabel.text = viewModelObject.modelObject.drawText
                wonLabel.isHidden = false
                playAgainOutlet.isHidden = false
            }
           
        }
        
    }
    
    
    // Play Again
    @IBAction func playAgain(_ sender: UIButton) {
        viewOutlet.isUserInteractionEnabled = true

       
        viewModelObject.resettingGame()
        wonLabel.isHidden = true
        playAgainOutlet.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
}

