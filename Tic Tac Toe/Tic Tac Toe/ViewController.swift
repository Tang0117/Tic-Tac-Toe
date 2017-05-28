//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Brendan Tang on 5/27/17.
//  Copyright © 2017 Brendan Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet var ButtonsAll: [UIButton]!
    
    @IBOutlet weak var Xwon: UILabel!
    @IBAction func Action(_ sender: AnyObject)
    {
        if(gameState[sender.tag - 1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag - 1] = activePlayer
            if(activePlayer == 1)
            {
                sender.setImage(UIImage(named: "X.jpg"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "O.jpg"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                if gameState[combination[0]] == 1
                {
                    Xwon.text = "X has won"
                    ButtonsAll.isUserInteractionEnabled = false
                    
                    
                    
                    
                }
                else
                {
                    Xwon.text = "O has won"
                    ButtonsAll.isUserInteractionEnabled = false

                    
                }
                PlayAgainAppear.isHidden = false
                Xwon.isHidden = false
            }
        }
        gameIsActive = false
        for i in gameState{
            if i == 0{
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false{
            Xwon.text = "Draw"
            Xwon.isHidden = false
            PlayAgainAppear.isHidden = false
        }
    }
    
    @IBOutlet weak var PlayAgainAppear: UIButton!
    @IBAction func PlayAgain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        ButtonsAll.isUserInteractionEnabled = true
        PlayAgainAppear.isHidden = true
        Xwon.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

