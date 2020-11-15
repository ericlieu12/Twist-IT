//
//  RecordsScene.swift
//  ShakeMe2
//
//  Created by user on 7/24/20.
//  Copyright © 2020 eric. All rights reserved.
//

import SpriteKit
import GameplayKit

class RecordsScene: SKScene {
    var viewController: MenuViewController!
       let defaults = UserDefaults.standard
    
    var playbutton2 = SKSpriteNode(imageNamed: "Cat_2")
    var recordslbl = SKLabelNode(fontNamed: "Qikki Reg")
    var scorelbl = SKLabelNode(fontNamed: "Qikki Reg")
    var hseasylbl = SKLabelNode(fontNamed: "Qikki Reg")
    var hsmediumlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var hshardlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var statuslbl = SKLabelNode(fontNamed: "Qikki Reg")
    var totalscore = 0
    var playerglow:SKSpriteNode!
let fadeout = SKAction.fadeOut(withDuration: 0.3)
    let fadein = SKAction.fadeIn(withDuration: 0.3)
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
    var textures: [SKTexture]!
    var home: SKSpriteNode!
    var moveslbl = SKLabelNode(fontNamed: "Qikki Reg")
    var playbutton = SKSpriteNode(imageNamed: "Cat_1")
    func changetextures(character: String) {
        
               playerglow = SKSpriteNode(imageNamed: character)
           playbutton = SKSpriteNode(imageNamed: character+"_1")
             playbutton2 = SKSpriteNode(imageNamed: character+"_2")
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
         textures = [char1,char4,char5,char8,char9,char12]
           
       }
    func rollplayer()
      {
          
       
          
          let appear = SKAction.fadeIn(withDuration: 0.01)
           
          
            
           
            let disappear = SKAction.fadeOut(withDuration: 0.01)
            
            playbutton2.run(SKAction.sequence([appear,SKAction.wait(forDuration: 0.29),disappear]))
                
                playbutton.run(SKAction.sequence([disappear,SKAction.wait(forDuration: 0.29),appear]))

                      
        
          
      }
    override func didMove(to view: SKView) {
         
                       home = childNode(withName: "home") as? SKSpriteNode
                      
                 
        changetextures(character: defaults.string(forKey: "Chosen") ?? "Owl")
        let playeranimation = SKAction.animate(with: textures, timePerFrame: 0.3)
                       playbutton.run(SKAction.repeatForever(playeranimation))
        playbutton.zPosition = 1
        playbutton.name = "player"
                         
         playbutton2.zPosition = 2
                             addChild(playbutton)
        let disappear = SKAction.fadeOut(withDuration: 0.0)
              addChild(playbutton2)
        playbutton2.run(disappear)
                playbutton2.position = playbutton.position
               playbutton.size = CGSize(width: 236.333*2, height: 199.333*2)
         playbutton2.size = playbutton.size
        playerglow.zPosition = 1
                       
                       playerglow.size = CGSize(width: 494.666*2, height: 373.333*2)
                           playerglow.position = playbutton.position
                      
                         
                       
                        addChild(playerglow)
        playerglow.run(fadeout)
        let endgame = defaults.integer(forKey: "endgame")
        let speed = defaults.integer(forKey: "speed")
        let recentscore = defaults.integer(forKey: "recentscore")
        if ( endgame != 0)
        {let moves = defaults.integer(forKey: "move")
            if (moves == 0)
            {moveslbl.text = "RAN OUT OF TIME"}
            if (moves == 1)
            {moveslbl.text = "WRONG MOVE"}
            moveslbl.position = CGPoint(x:0, y:500)
                              moveslbl.zPosition = 3
                              moveslbl.fontSize = 60
                              moveslbl.fontColor = UIColor.black
                       addChild(moveslbl)
            recordslbl.text = "GAME OVER"
                   recordslbl.position = CGPoint(x:0, y:600)
                   recordslbl.zPosition = 3
                   recordslbl.fontSize = 150
                   recordslbl.fontColor = UIColor.black
            addChild(recordslbl)
            
            
                                
            
            if ( speed == 0)
            {
                scorelbl.text = "SCORE: " + String(recentscore) + " (EASY)"
            }
            if (speed == 1)
            {
                           scorelbl.text = "SCORE: " + String(recentscore) + " (MEDIUM)"
                       }
            if (speed == 2)
                       {
                           scorelbl.text = "SCORE: " + String(recentscore) + " (HARD)"
                       }
            scorelbl.position = CGPoint(x:0, y:400)
                                            scorelbl.zPosition = 3
                                            scorelbl.fontSize = 60
                                            scorelbl.fontColor = UIColor.black
                                     addChild(scorelbl)
        }
        if (endgame == 0)
              {   let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                                                
                                                 lightImpactFeedbackGenerator.prepare()

                                                
                                                 lightImpactFeedbackGenerator.impactOccurred()
                  recordslbl.text = "RECORDS"
                         recordslbl.position = CGPoint(x:0, y:600)
                         recordslbl.zPosition = 3
                         recordslbl.fontSize = 150
                         recordslbl.fontColor = UIColor.black
                  addChild(recordslbl)
                
                
                
                if (speed == 0)
                           {
                               scorelbl.text = "RECENT SCORE: " + String(recentscore) + " (EASY)"
                           }
                           if (speed == 1)
                           {
                                          scorelbl.text = "RECENT SCORE: " + String(recentscore) + " (MEDIUM)"
                                      }
                           if (speed == 2)
                                      {
                                          scorelbl.text = "RECENT SCORE: " + String(recentscore) + " (HARD)"
                                      }
               
                       scorelbl.position = CGPoint(x:0, y:400)
                       scorelbl.zPosition = 3
                       scorelbl.fontSize = 60
                       scorelbl.fontColor = UIColor.black
                addChild(scorelbl)
              }
        
                                 hseasylbl.position = CGPoint(x:0, y:-400)
                                 hseasylbl.zPosition = 3
                                 hseasylbl.fontSize = 60
                                 hseasylbl.fontColor = UIColor.black
                hseasylbl.text = "HIGH SCORE: " + String(defaults.integer(forKey: "hseasy")) + " (EASY)"
        addChild(hseasylbl)

                         hsmediumlbl.position = CGPoint(x:0, y:-500)
                         hsmediumlbl.zPosition = 3
                         hsmediumlbl.fontSize = 60
                         hsmediumlbl.fontColor = UIColor.black
        hsmediumlbl.text = "HIGH SCORE: " + String(defaults.integer(forKey: "hsmedium")) + " (MEDIUM)"
addChild(hsmediumlbl)
                         hshardlbl.position = CGPoint(x:0, y:-600)
                         hshardlbl.zPosition = 3
                         hshardlbl.fontSize = 60
                         hshardlbl.fontColor = UIColor.black
        hshardlbl.text = "HIGH SCORE: " + String(defaults.integer(forKey: "hshard"))
        + " (HARD)"
        addChild(hshardlbl)
        if (endgame == 2)
        {statuslbl.position = CGPoint(x:0, y:300)
                                statuslbl.zPosition = 3
                                statuslbl.fontSize = 60
                                statuslbl.fontColor = UIColor.black
        statuslbl.text = "NEW HIGH SCORE!!"
            
                  let grow = SKAction.scale(by: 1.2, duration: 0.2)
                  let shrink = SKAction.scale(by: 0.8333, duration: 0.2)
                  
            let growshrinkdie = SKAction.sequence([grow, shrink, SKAction.wait(forDuration: 3)])
                
      let roll = SKAction.rotate(byAngle: CGFloat(Double.pi*2), duration: 0.4)
            playbutton.run(SKAction.repeatForever(SKAction.sequence([roll, SKAction.wait(forDuration: 3)])))
            playerglow.run(SKAction.repeatForever(SKAction.sequence([fadein, fadeout,SKAction.wait(forDuration: 3)])))
            addChild(statuslbl)
            statuslbl.run(SKAction.repeatForever(growshrinkdie))
        }
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       for touch in (touches) {
                  let positionInScene = touch.location(in: self)
                  let touchedNode = self.atPoint(positionInScene)
                  if let name = touchedNode.name {
                      if name == "player" {
                        rollplayer()
                        
                          
                       
                      }
                    if name == "home"
                    {  home.texture = SKTexture(imageNamed: "home1")
                        viewController.menusceneload()
                    }
               
         }
        
    }}
}
