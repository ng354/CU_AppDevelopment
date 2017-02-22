//
//  ViewController.swift
//  Ng354_P6
//
//  Created by Nikita Gupta on 11/3/14.
//  Copyright (c) 2014 Nikita Gupta. All rights reserved.
//

import UIKit

class Ng354ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var timer: NSTimer!
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    var gravity: UIGravityBehavior!
    var gameOver = false
    var collision: UICollisionBehavior!
    @IBOutlet var shipImage: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        shipImage.center = CGPoint(x: view.center.x, y: shipImage.center.y)
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0 / 2.0, target: self, selector: "fireTimer:", userInfo: nil, repeats: true)
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [])
        animator.addBehavior(gravity)
        
        
        
        collision = UICollisionBehavior(items: [shipImage])
        collision.translatesReferenceBoundsIntoBoundary = false
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    }
    
    
    
    func fireTimer(sender: NSTimer) {
        var rockImage = UIImageView(image: UIImage(named: "rock"))
        rockImage.frame = CGRect(x: drand48() * Double(view.bounds.width) - 30, y: 5, width: 30, height: 30)
        view.addSubview(rockImage)
        collision.addItem(rockImage)
        gravity.addItem(rockImage)
    }
    
    @IBAction func panShip(sender: UIPanGestureRecognizer) {
        let ship = sender.view!
        let point = sender.translationInView(view)
        ship.center = CGPoint(x: ship.center.x + point.x, y:ship.center.y + point.y)
        sender.setTranslation(CGPointZero, inView: view)
        animator.updateItemUsingCurrentState(shipImage)
    }
    
    
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        if item1 === shipImage || item2 === shipImage {
            gameOver = true
            var alert = UIAlertController(title: "GAME OVER", message: "Sorry! You lost!", preferredStyle: .Alert)
            var okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) {
                UIAlertAction in
            }
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
    }
}

}

