//
//  GameScene.swift
//  Brick Breaker
//
//  Created by Mo Syed on 7/9/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball = SKSpriteNode()
    var paddle = SKSpriteNode()
    
    struct game {
        static var IsOver : Bool = false
    }

    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        paddle = self.childNode(withName: "paddle") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        self.physicsWorld.contactDelegate = self
        
     }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchloc = touch.location(in: self)
            paddle.position.x = touchloc.x
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchloc = touch.location(in: self)
            paddle.position.x = touchloc.x
        }

        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let body_a_name = contact.bodyA.node?.name
        let body_b_name = contact.bodyB.node?.name
        
        if (body_a_name == "ball" && body_b_name == "bricks") || (body_b_name == "ball" && body_a_name == "bricks") {
            if body_a_name ==  "bricks" {
                contact.bodyA.node?.removeFromParent()

            }
            else if body_b_name == "bricks" {
                contact.bodyB.node?.removeFromParent()
            }
    }
        if (body_a_name == "ball" && body_b_name == "line") || (body_b_name == "ball" && body_a_name == "line") {
           displayGameOver()
            game.IsOver = true
            //goToGameScene()
        }
    }
    
    func goToGameScene(){
//        let gameScene:GameScene = GameScene(size: self.view!.bounds.size) // create your new scene
//        let transition = SKTransition.fadeWithDuration(1.0) // create type of transition (you can check in documentation for more transtions)
//        gameScene.scaleMode = SKSceneScaleMode.Fill
//        self.view!.presentScene(gameScene, transition: transition)
//    }
        let gameOverScene = GameOverScene(size: size)
        gameOverScene.scaleMode = scaleMode
        
        let reveal = SKTransition.flipVertical(withDuration: 0.5)
        //  flipHorizontal(withDuration: 0.5)
        view?.presentScene(gameOverScene, transition: reveal)
    }
    
    
    func displayGameOver() {

        let gameOverScene = GameOverScene(size: size)
        gameOverScene.scaleMode = scaleMode

        let reveal = SKTransition.flipVertical(withDuration: 0.5)
      //  flipHorizontal(withDuration: 0.5)
        view?.presentScene(gameOverScene, transition: reveal)
    }
   
}

class GameOverScene: SKScene {

    var notificationLabel = SKLabelNode(text: "You Lost!")

    override init(size: CGSize) {
        super.init(size: size)

        self.backgroundColor = SKColor.black

        addChild(notificationLabel)
        notificationLabel.fontSize = 32.0
        notificationLabel.color = SKColor.red
        notificationLabel.fontName = "Thonburi-Bold"
        notificationLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode

        let reveal = SKTransition.flipVertical(withDuration: 0.5)
        view?.presentScene(gameScene, transition: reveal)
    }
}
