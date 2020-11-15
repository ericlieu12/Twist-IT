//
//  ProfileScene.swift
//  ShakeMe2
//
//  Created by user on 7/23/20.
//  Copyright © 2020 eric. All rights reserved.
//

import SpriteKit
import GameplayKit

class ProfileScene: SKScene {


 
    let defaults = UserDefaults.standard
    
     var viewController: MenuViewController!
    var char1 = SKTexture(imageNamed: "Cat_1")
      var char2 = SKTexture(imageNamed: "Cat_2")
      var char3 = SKTexture(imageNamed: "Cat_3")
      var char4 = SKTexture(imageNamed: "Cat_4")
      var char5 = SKTexture(imageNamed: "Cat_5")
      var char6 = SKTexture(imageNamed: "Cat_6")
      var char7 = SKTexture(imageNamed: "Cat_7")
      var char8 = SKTexture(imageNamed: "Cat_8")
      var char9 = SKTexture(imageNamed: "Cat_9")
      var char10 = SKTexture(imageNamed: "Cat_10")
      var char11 = SKTexture(imageNamed: "Cat_11")
      var char12 = SKTexture(imageNamed: "Cat_12")
      var char13 = SKTexture(imageNamed: "Cat_13")
    let instructionlabel = SKLabelNode(fontNamed: "Qikki reg")
    var character: SKSpriteNode!
    var Cat: SKSpriteNode!
    var Owl: SKSpriteNode!
    var Sheep: SKSpriteNode!
    var Rabbit: SKSpriteNode!
    var Lizard: SKSpriteNode!
    var Unicorn: SKSpriteNode!
    var Octopus: SKSpriteNode!
    var Pig: SKSpriteNode!
    var Spider: SKSpriteNode!
    var textures: [SKTexture]!
    var home:SKSpriteNode!
    override func didMove(to view: SKView) {
         home = childNode(withName: "home") as? SKSpriteNode
            instructionlabelsetup()
         character = childNode(withName: "character") as? SKSpriteNode
   
        Cat = childNode(withName: "Cat") as? SKSpriteNode
        Owl = childNode(withName: "Owl") as? SKSpriteNode
        Sheep = childNode(withName: "Sheep") as? SKSpriteNode
        Unicorn = childNode(withName: "Unicorn") as? SKSpriteNode
        Rabbit = childNode(withName: "Rabbit") as? SKSpriteNode
        Octopus = childNode(withName: "Octopus") as? SKSpriteNode
        Pig = childNode(withName: "Pig") as? SKSpriteNode
        Spider = childNode(withName: "Spider") as? SKSpriteNode
        Lizard = childNode(withName: "Cat") as? SKSpriteNode
           
        charsetup()
        changetextures(character: defaults.string(forKey: "Chosen") ?? "Owl")
              }
    
    func changetextures(character: String) {
         char1 = SKTexture(imageNamed: character+"_1")
            char2 = SKTexture(imageNamed: character+"_2")
            char3 = SKTexture(imageNamed: character+"_3")
            char4 = SKTexture(imageNamed: character+"_4")
            char5 = SKTexture(imageNamed: character+"_5")
            char6 = SKTexture(imageNamed: character+"_6")
            char7 = SKTexture(imageNamed: character+"_7")
            char8 = SKTexture(imageNamed: character+"_8")
            char9 = SKTexture(imageNamed: character+"_9")
            char10 = SKTexture(imageNamed: character+"_10")
            char11 = SKTexture(imageNamed: character+"_11")
            char12 = SKTexture(imageNamed: character+"_12")
            char13 = SKTexture(imageNamed: character+"_13")
        charsetup()
        
    }
    func charsetup()
    {
   
      textures = [char1,char2,char3,char4,char5,char6,char7,char8,char9,char10,char11,char12,char13]
   let playeranimation = SKAction.animate(with: textures, timePerFrame: 0.5)
               character.run(SKAction.repeatForever(playeranimation))
      let roll = SKAction.rotate(byAngle: CGFloat(Double.pi*2), duration: 0.5)
           character.run(roll)
        
    }
    func instructionlabelsetup() {
      
        instructionlabel.text = "CHOOSE YOUR CHARACTER"
                 instructionlabel.fontSize = 65
        instructionlabel.fontColor = UIColor.black
        instructionlabel.zPosition = 1
        
                 instructionlabel.position = CGPoint(x: 0, y: 0)
                              
        addChild(instructionlabel)    }

      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                  for touch in (touches) {
                             let positionInScene = touch.location(in: self)
                             let touchedNode = self.atPoint(positionInScene)
                             if let name = touchedNode.name {
                                 if (name != "home" && name != "character")
                                 {
                                    changetextures(character:touchedNode.name!)
                                   defaults.set(touchedNode.name!, forKey: "Chosen")
                                     
                                  
                                 }
                               if name == "home"
                               {home.texture = SKTexture(imageNamed: "home1")
                                   viewController.menusceneload()
                               }
                               if name == "profile"
                                                      {   
                                                          viewController.profilesceneload()
                                                      }
                    
                    }
                   
               }}
       
}
