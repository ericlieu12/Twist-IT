//
//  SettingsScene.swift
//  ShakeMe2
//
//  Created by user on 7/23/20.
//  Copyright © 2020 eric. All rights reserved.
//

import SpriteKit
import GameplayKit

class SettingsScene: SKScene {
    var viewController: MenuViewController!
    let defaults = UserDefaults.standard
    var difficultylbl = SKLabelNode(fontNamed: "Qikki Reg")
     var settingslbl = SKLabelNode(fontNamed: "Qikki Reg")
    var characterlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var easy:SKSpriteNode!
    var medium:SKSpriteNode!
    var hard:SKSpriteNode!
    var pro:SKSpriteNode!
    var player:SKSpriteNode!
    var music:SKSpriteNode!
    var musiclock:SKSpriteNode!
    var music2:SKSpriteNode!
       var music2lock:SKSpriteNode!
    var home:SKSpriteNode!
    var musiclbl = SKLabelNode(fontNamed: "Qikki Reg")
     var music2lbl = SKLabelNode(fontNamed: "Qikki Reg")
   var musicplaying = SKAudioNode(fileNamed: "tropical.wav")
    var musictrack = 4
    var music2track = 4
    override func didMove(to view: SKView) {
     
        musictrack = defaults.integer(forKey: "musictrack")
      
        music2track = defaults.integer(forKey: "music2track")
       home = childNode(withName: "done") as? SKSpriteNode
        player = childNode(withName: "player") as? SKSpriteNode
       music = childNode(withName: "music") as? SKSpriteNode
        musiclock = childNode(withName: "musiclock") as? SKSpriteNode
        music2 = childNode(withName: "music2") as? SKSpriteNode
        music2lock = childNode(withName: "music2lock") as? SKSpriteNode
        player.texture = SKTexture(imageNamed: (defaults.string(forKey: "Chosen") ?? "Owl") + "_1")
        
        easy = childNode(withName: "easy") as? SKSpriteNode
        settingslbl.text = "SETTINGS"
        settingslbl.position = CGPoint(x:0, y:600)
        settingslbl.zPosition = 3
        settingslbl.fontSize = 150
        settingslbl.fontColor = UIColor.black
        characterlbl.text = "CHARACTER"
        characterlbl.position = CGPoint(x:-260, y:65)
        characterlbl.zPosition = 3
        characterlbl.fontSize = 80
        characterlbl.fontColor = UIColor.black
        addChild(characterlbl)
        musiclbl.text = "GAME MUSIC"
        musiclbl.position = CGPoint(x:-240, y:-175)
        musiclbl.zPosition = 3
        musiclbl.fontSize = 80
        musiclbl.fontColor = UIColor.black
        addChild(musiclbl)
        music2lbl.text = "MENU MUSIC"
        music2lbl.position = CGPoint(x:-240, y:-415)
        music2lbl.zPosition = 3
        music2lbl.fontSize = 80
        music2lbl.fontColor = UIColor.black
        addChild(music2lbl)

        settingslbl.fontColor = UIColor.black
        difficultylbl.text = "DIFFICULTY"
        difficultylbl.position = CGPoint(x:-270, y: 305)
        difficultylbl.zPosition = 3
        difficultylbl.fontSize = 80
        difficultylbl.fontColor = UIColor.black
        addChild(settingslbl)
        addChild(difficultylbl)
       
         medium = childNode(withName: "medium") as? SKSpriteNode
        hard = childNode(withName: "hard") as? SKSpriteNode
        pro = childNode(withName: "pro") as? SKSpriteNode
        if (defaults.integer(forKey: "speed") == 0)
        { easy.zPosition = 1
        medium.zPosition = -1
        hard.zPosition = -1
            pro.zPosition = -1}
        if (defaults.integer(forKey: "speed") == 1)
              { easy.zPosition = -1
              medium.zPosition = 1
              hard.zPosition = -1
                  pro.zPosition = -1}
        if (defaults.integer(forKey: "speed") == 2)
              { easy.zPosition = -1
              medium.zPosition = -1
              hard.zPosition = 1
                  pro.zPosition = -1}
        if (defaults.integer(forKey: "speed") == 3)
              { easy.zPosition = -1
              medium.zPosition = -1
              hard.zPosition = -1
                  pro.zPosition = 1}
        
        if (musictrack == 1)
                                              {
                                                  musiclock.zPosition = 1
                                                  music.zPosition = 0
                                                 
                                              }
                   if (music2track == 1)
                                              {
                                                  music2lock.zPosition = 1
                                                  music2.zPosition = 0
                                                 
                                              }
       
    }
    func playmusic(track:Int)
    { musicplaying.removeFromParent()
      
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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       for touch in (touches) {
                  let positionInScene = touch.location(in: self)
                  let touchedNode = self.atPoint(positionInScene)
                  if let name = touchedNode.name {
                      if name == "easy" {
                        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                                             
                                              lightImpactFeedbackGenerator.prepare()

                                             
                                              lightImpactFeedbackGenerator.impactOccurred()
                        defaults.set(1, forKey: "speed")
                        print(defaults.integer(forKey: "speed"))
                          easy.zPosition = -1
                          medium.zPosition = 1
                          hard.zPosition = -1
                          pro.zPosition = -1
                       
                      }
                    if name == "medium"
                    {    let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                                         
                                          lightImpactFeedbackGenerator.prepare()

                                         
                                          lightImpactFeedbackGenerator.impactOccurred()
                        defaults.set(2, forKey: "speed")
                        print(defaults.integer(forKey: "speed"))
                        easy.zPosition = -1
                        medium.zPosition = -1
                        hard.zPosition = 1
                        pro.zPosition = -1

                    }
                    if name == "done"
                    {
                        defaults.set(musictrack, forKey: "musictrack")
                                                     defaults.set(music2track, forKey: "music2track")
                        home.texture = SKTexture(imageNamed: "home1")
                        viewController.menusceneload()
                        
                    }
                    if name == "player"
                    { 
                        defaults.set(musictrack, forKey: "musictrack")
                        defaults.set(music2track, forKey: "music2track")
                        viewController.profilesceneload()
                    }
                    if name == "hard"
                                        { let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                                                                 
                                                                  lightImpactFeedbackGenerator.prepare()

                                                                 
                                                                  lightImpactFeedbackGenerator.impactOccurred()
                                         defaults.set(0, forKey: "speed")
                                            print(defaults.integer(forKey: "speed"))
                                            easy.zPosition = 1
                                            medium.zPosition = -1
                                            hard.zPosition = -1
                                            pro.zPosition = -1

                                           }
                    if name == "pro"
                                           {  defaults.set(0, forKey: "speed")
                                            print(defaults.integer(forKey: "speed"))
                                            easy.zPosition = 1
                                            medium.zPosition = -1
                                            hard.zPosition = -1
                                            pro.zPosition = -1

                                           }
                    if (name == "music" || name == "musiclock")
                                                         {  let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                                                                              
                                                                               lightImpactFeedbackGenerator.prepare()

                                                                              
                                                                               lightImpactFeedbackGenerator.impactOccurred()
                                                            if (musictrack == 5)
                        {musictrack = 0}
                        else { musictrack+=1}
                            playmusic(track: musictrack)
                            if (musictrack == 1)
                            {
                                musiclock.zPosition = 1
                                music.zPosition = 0
                               
                            }
                            else
                            {
                                musiclock.zPosition = 0
                                music.zPosition = 1
                            }

                        }

                    if (name == "music2" || name == "music2lock")
                                      {
                                        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                                                             
                                                              lightImpactFeedbackGenerator.prepare()

                                                             
                                                              lightImpactFeedbackGenerator.impactOccurred()
                                        if (music2track == 5)
                                      {music2track = 0}
                                      else { music2track+=1}
                                          playmusic(track: music2track)
                                          if (music2track == 1)
                                          {
                                              music2lock.zPosition = 1
                                              music2.zPosition = 0
                                             
                                          }
                                          else
                                          {
                                              music2lock.zPosition = 0
                                              music2.zPosition = 1
                                          }

                                      }
         
         }
        
    }}
}
