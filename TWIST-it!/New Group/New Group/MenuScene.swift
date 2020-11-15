//
//  MenuScene.swift
//  ShakeMe2
//
//  Created by user on 7/21/20.
//  Copyright © 2020 eric. All rights reserved.
//


import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    let defaults = UserDefaults.standard
    var playbutton2 = SKSpriteNode(imageNamed: "Cat_2")
    var playbutton = SKSpriteNode(imageNamed: "Cat_1")
         var viewController: MenuViewController!
      let scorelabel = SKLabelNode(fontNamed: "Qikki Reg")
    let scorelabel2 = SKLabelNode(fontNamed: "Qikki Reg")
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
    var start:SKSpriteNode!
    var profile:SKSpriteNode!
    var settings:SKSpriteNode!
    var help:SKSpriteNode!
    var records:SKSpriteNode!
    var musicplaying = SKAudioNode(fileNamed: "tropical.wav")
        override func didMove(to view: SKView) {
            
            playbutton.zPosition = 1
                        
                                              
                              playbutton2.zPosition = 2
            help = childNode(withName: "help") as? SKSpriteNode
            records = childNode(withName: "records") as? SKSpriteNode
            playmusic(track: defaults.integer(forKey:"music2track"))
            settings = childNode(withName: "settings") as? SKSpriteNode
            changetextures(character: defaults.string(forKey: "Chosen") ?? "Owl")
            playbuttonsetup()
                   scorelabelsetup()
            scorelabelsetup2()
             start = childNode(withName: "start") as? SKSpriteNode
             profile = childNode(withName: "profile") as? SKSpriteNode
            }
    func playmusic(track:Int)
       {
           if (track == 5)
           {   musicplaying = SKAudioNode(fileNamed: "piano.wav")
               
               addChild(musicplaying)
                 }
           if (track == 2)
                  {   musicplaying = SKAudioNode(fileNamed: "song2.wav")
                      addChild(musicplaying)
                        }
           if (track == 3)
                         {   musicplaying = SKAudioNode(fileNamed: "song3.wav")
                             addChild(musicplaying)
                               }
           if (track == 4)
                         {   musicplaying = SKAudioNode(fileNamed: "song4.wav")
                             addChild(musicplaying)
                               }
           
           if (track == 0)
                  {   musicplaying = SKAudioNode(fileNamed: "tropical.wav")
                      addChild(musicplaying)
                        }
       
           
       }
    func changetextures(character: String) {
        
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
        
    }
    func scorelabelsetup() {
       
        scorelabel.fontSize = 150
        scorelabel.position = CGPoint(x: 0, y: 600)
         scorelabel.fontColor = UIColor.black
        scorelabel.text = "TWIST"
         addChild(scorelabel)

    }
    func scorelabelsetup2() {
       
        scorelabel2.fontSize = 150
        scorelabel2.position = CGPoint(x:0, y: 400)
         scorelabel2.fontColor = UIColor.black
        scorelabel2.text = "it!"
         addChild(scorelabel2)

    }
    func playbuttonsetup() {
      var textures = [char1,char4,char5,char8,char9,char12]
    let playeranimation = SKAction.animate(with: textures, timePerFrame: 0.3)
             playbutton.run(SKAction.repeatForever(playeranimation))

        playbutton.zPosition = 1
                     
                      playbutton.name = "player"
                  
                      addChild(playbutton)
        //blink position
        playbutton.size = CGSize(width: 236.333*2, height: 199.333*2)
        playbutton2.size = playbutton.size
              playbutton2.position = playbutton.position
              
              playbutton2.zPosition = 2
        let disappear = SKAction.fadeOut(withDuration: 0.0)
              addChild(playbutton2)
        playbutton2.run(disappear)
            
              
                     
                      
           }
    func rollplayer()
    {   
        
        let number = Int.random(in: 1 ..< 10)
        if (number==9)
              {  let roll = SKAction.rotate(byAngle: CGFloat(Double.pi*2), duration: 0.5)
                  playbutton.run(roll)}
        else
        {let appear = SKAction.fadeIn(withDuration: 0.01)
          
            
            
           
            let disappear = SKAction.fadeOut(withDuration: 0.01)
            
            playbutton2.run(SKAction.sequence([appear,SKAction.wait(forDuration: 0.29),disappear]))
                
                playbutton.run(SKAction.sequence([disappear,SKAction.wait(forDuration: 0.29),appear]))
              
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
                        if name == "start"
                        {   start.texture = SKTexture(imageNamed: "play1")
                            viewController.gamesceneload()
                        }
                        if name == "settings"
                        {settings.texture = SKTexture(imageNamed: "settings1")
                                                
                                              
                                                   viewController.settingssceneload()
                                               }
                        if name == "profile"
                        {profile.texture = SKTexture(imageNamed: "profile1")
                                                   viewController.profilesceneload()
                                               }
                        if name == "help"
                                                                      {
                                            help.texture = SKTexture(imageNamed: "help1")
                                                                        viewController.helpsceneload()
                                                                      }
             if name == "records"
             {defaults.set(0, forKey: "endgame")
                records.texture = SKTexture(imageNamed: "records1")
                 viewController.recordssceneload()
                
             }
             }
            
        }}
}
