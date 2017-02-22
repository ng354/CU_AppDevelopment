//
//  ViewController.swift
//  Ng354_P10
//
//  Created by Nikita Gupta on 11/29/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class Ng354ViewController: UIViewController {
    
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let BOARD_SIZE:Int = 10
    var board:Board
    var squareButtons:[SquareButton] = []
    
    var moves:Int = 0 {
        didSet {
            self.movesLabel.text = "Moves: \(moves)"
            self.movesLabel.sizeToFit()
        }
    }
    
    var timeTaken:Int = 0 {
        didSet {
            self.timeLabel.text = "Time: \(timeTaken)"
            self.timeLabel.sizeToFit()
        }
    }

    var oneSecondTimer: NSTimer?
    
    
    required init(coder aDecoder: NSCoder)
    {
        self.board = Board(size: BOARD_SIZE)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeBoard()
        self.startNewGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func initializeBoard() {
        for row in 0 ..< board.size {
            for col in 0 ..< board.size {
                let square = board.squares[row][col]
                let squareSize:CGFloat = self.boardView.frame.width / CGFloat(BOARD_SIZE)
                let squareButton = SquareButton(squareModel: square, squareSize: squareSize, squareMargin: 0)
                squareButton.setTitle("[x]", forState: .Normal)
                squareButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
                squareButton.addTarget(self, action: "squareButtonpressed:", forControlEvents: .TouchUpInside)
                self.boardView.addSubview(squareButton)
                self.squareButtons.append(squareButton)
            }
        }
    }

    func resetBoard() {
        // resets the board with new mine locations & sets isRevealed to false for each square
        self.board.resetBoard()
        // iterates through each button and resets the text to the default value
        for squareButton in self.squareButtons {
            squareButton.setTitle("[x]", forState: .Normal)
        }
    }
    
    func startNewGame() {
        //start new game
        self.resetBoard()
        self.timeTaken = 0
        self.moves = 0
        self.oneSecondTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("oneSecond"), userInfo: nil, repeats: true)
    }

    
    func oneSecond() {
        self.timeTaken++
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newGamePressed(sender: AnyObject) {
        self.endCurrentGame()
        self.startNewGame()
    }
    
    
    func squareButtonPressed(sender: SquareButton) {
        if(!sender.square.isRevealed) {
            sender.square.isRevealed = true
            sender.setTitle("\(sender.getLabelText())", forState: .Normal)
            self.moves++
        }
        if sender.square.isMineLocation {
            self.minePressed()
        }
    }
    
    func minePressed() {
        // show an alert when you tap on a mine
        self.endCurrentGame()
        var alertView = UIAlertView()
        alertView.addButtonWithTitle("New Game")
        alertView.title = "You Lost the Game!"
        alertView.message = "You tapped on a mine."
        alertView.show()
        alertView.delegate = self
    }
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        //start new game when the alert is dismissed
        self.startNewGame()
    }
    
    
    func endCurrentGame() {
        self.oneSecondTimer!.invalidate()
        self.oneSecondTimer = nil
    }

    

}

