//
//  GameScene.swift
//  ShakeMe2
//
//  Created by user on 7/5/20.
//  Copyright © 2020 eric. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
      let defaults = UserDefaults.standard
      var viewController: MenuViewController!
    var motionManager = CMMotionManager()
    var player : SKSpriteNode!
       
    let background = SKSpriteNode(imageNamed:"3")
        let scorelabel = SKLabelNode(fontNamed: "Qikki Reg")
    var char1:SKTexture!
    
    var char2:SKTexture!
    var char3:SKTexture!
    var char4:SKTexture!
    var char5:SKTexture!
    var char6:SKTexture!
    var char7:SKTexture!
    var char8:SKTexture!
    var char9:SKTexture!
    var char10:SKTexture!
    var char11:SKTexture!
    var char12:SKTexture!
    var char13:SKTexture!
    var horizant:SKSpriteNode!
    var stop = true
    var playerglow:SKSpriteNode!
    let fadein = SKAction.fadeIn(withDuration: 0.1)
    let fadeout = SKAction.fadeOut(withDuration: 1.0)
         let instructionlabel = SKLabelNode(fontNamed: "Qikki Reg")
        var timer = Timer()
    var time = 0
        var instruction = 0
        var action = 0
        var score = 0
        var isChecking = false
       
        var musicplaying = SKAudioNode()
        var rotationorder = [Int]()
    
    var textures : [SKTexture]!
      
        override func didMove(to view: SKView) {
           
         changetextures(character: defaults.string(forKey: "Chosen") ?? "Owl")
           doTime()
           
            
            
              
             
             
           playersetup()
            
            scorelabelsetup()
            instrutionlabelsetup()
          playmusic(track: defaults.integer(forKey:"musictrack"))
      
     
                      
            
            }
    
       func changetextures(character: String) {
              horizant = SKSpriteNode(imageNamed: character+"_horizontal")
              player = SKSpriteNode(imageNamed: character+"_1")
        playerglow = SKSpriteNode(imageNamed: character)
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
         textures = [char1,char2,char3,char4,char5,char6,char7,char8,char9,char10,char11,char12,char13]
              
        
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
       
       
        func playersetup() {
    
            player.position = CGPoint(x: 0, y:0)//coorodiantes fucked
            player.zPosition = 2
            playerglow.zPosition = 1
            player.size = CGSize(width: 236.333*2, height: 199.333*2)
            playerglow.size = CGSize(width: 494.666*2, height: 373.333*2)
                playerglow.position = player.position
           
                   player.name = "player"
              
                   addChild(player)
             addChild(playerglow)
            let playeranimation = SKAction.animate(with: textures, timePerFrame: 0.5)
            player.run(SKAction.repeatForever(playeranimation))
            let grow = SKAction.scale(by: 1.2, duration: 1.0)
            let shrink = SKAction.scale(by: 0.83333, duration: 1.0)
              
                       let growshrinkdie = SKAction.sequence([grow, shrink])
            player.run(SKAction.repeatForever(growshrinkdie))
            
                   playerglow.run(fadeout)
                   
        }
        func scorelabelsetup()
        {
            scorelabel.fontSize = 300
            scorelabel.position = CGPoint(x: 0, y: 700)
             scorelabel.fontColor = UIColor.black
            scorelabel.zPosition = 1
            scorelabel.text = String(score)
             addChild(scorelabel)
        }
        func instrutionlabelsetup() {
            instructionlabel.text = "GET READY"
            instructionlabel.fontSize = 100
            instructionlabel.zPosition = 1
            horizant.size = CGSize(width: 400, height: 200)
            addChild(horizant)
            horizant.run(SKAction.fadeOut(withDuration: 0))
            instructionlabel.position = CGPoint(x: 0, y: 475)
            horizant.position = CGPoint(x: 0, y: 525)
                          instructionlabel.fontColor = UIColor.black
            addChild(instructionlabel)
            instructionlabel.run(SKAction.sequence([SKAction.wait(forDuration:1), SKAction.fadeOut(withDuration: 0)]))
                         
            
        }
        
        func doTime() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerthings), userInfo: nil, repeats: true)
        }
        @objc func timerthings() {
           // let difficulty =  userdefault.integer(forKey: "Difficulty")
            time += 1
            let speed = 4 - defaults.integer(forKey: "speed")
            
            if (time%speed == 0)
            {
                changeinstructions()
            
                let seconds = Double(speed) - 0.5
                let secondss = 0.55
                DispatchQueue.main.asyncAfter(deadline: .now() + secondss, execute: {
                    self.enablechecking()
                               })
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: {
                    if (self.stop == true)
                   {  self.disablecheck()}
                   
                })
            }
            
        }
        
        func enablechecking()
        { isChecking = true
           
            motionManager.gyroUpdateInterval = 0.15
                      
                      motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
                          if let myData = data
                          {
                          
                              if myData.rotationRate.z > 3
                              {self.motionManager.stopGyroUpdates()

                                self.zpos()
                                  
                              }
                           if myData.rotationRate.z < -3
                           {self.motionManager.stopGyroUpdates()

                            self.zneg()                  }
                            if myData.rotationRate.x > 3
                               {self.motionManager.stopGyroUpdates()

                                self.xpos()
                                   
                               }
                            if myData.rotationRate.x < -3
                            {self.motionManager.stopGyroUpdates()

                                self.xneg()                  }
                            if myData.rotationRate.y > 3
                               {self.motionManager.stopGyroUpdates()

                                self.ypos()
                                   
                               }
                            if myData.rotationRate.y < -3
                            {self.motionManager.stopGyroUpdates()
self.yneg()                  }
                            
                            
                          }
                      }
    }
        func checkAction(check: Int) {
         
            if (isChecking == true)
            {if (action == check)
            {
                playerglow.run(SKAction.sequence([fadein, fadeout]))
                score+=1
                scorelabel.text = String(score)
                isChecking = false
                print("OK")
            }
            else {
                isChecking = false
            print("no")
                defaults.set(1, forKey: "move")
                endgame()
                
                 
            }
                }
        }
        func disablecheck() {
              defaults.set(0, forKey: "move")
            isChecking = false
            print("slime")
            if (action == 0)
            {
                endgame()}
            action = 0
            
            
            
        }

        func endgame() {
            print("----")
            self.motionManager.stopGyroUpdates()
            self.scene!.removeAllActions()
            self.scene?.run(SKAction.stop())
            timer.invalidate()
            stop=false
            defaults.set((score+defaults.integer(forKey:"totalscore")), forKey: "totalscore")
             defaults.set(1, forKey: "endgame")
            defaults.set(score, forKey: "recentscore")
            if (defaults.integer(forKey: "speed") == 0)
            {
            if (score > defaults.integer(forKey: "hseasy"))
            { defaults.set(score, forKey: "hseasy")
                defaults.set(2, forKey: "endgame")}
            }
            if (defaults.integer(forKey: "speed") == 1)
                       {
                       if (score > defaults.integer(forKey: "hsmedium"))
                       { defaults.set(score, forKey: "hsmedium")
                        defaults.set(2, forKey: "endgame")}
            }
            if (defaults.integer(forKey: "speed") == 2)
                       {
                       if (score > defaults.integer(forKey: "hshard"))
                       { defaults.set(score, forKey: "hshard")
                        defaults.set(2, forKey: "endgame")}
            }
            self.viewController.recordssceneload()
           
            
            
        }
        func animatelabel(label: SKLabelNode)
        { var speeed = Double(defaults.integer(forKey: "speed"))
            speeed *= 0.1
            if (speeed == 0)
            { speeed = 0.1}
            speeed = 0.25 - speeed
           let appear = SKAction.fadeAlpha(to: 1, duration: speeed)
            let grow = SKAction.scale(by: 1.2, duration: speeed)
            let shrink = SKAction.scale(by: 0.8333, duration: speeed)
            let die = SKAction.fadeAlpha(to: 0, duration: speeed)
            let growshrinkdie = SKAction.sequence([SKAction.wait(forDuration: 0.5),appear, grow, shrink, die])
            label.run(growshrinkdie)
            horizant.run(SKAction.sequence([fadein, SKAction.wait(forDuration: 0.35), SKAction.fadeOut(withDuration: 0.05)]))
          
        }
        func changeinstructions() {
            print("NEW")
            let number = Int.random(in: 0 ..< 7)
            
                   if (number==0){
                       instructionlabel.text = "ROTATE LEFT"
                    animatelabel(label: instructionlabel)
                       instruction = 1
                   }
            if (number==1){
                                 instructionlabel.text = "ROTATE RIGHT"
                              animatelabel(label: instructionlabel)
                                 instruction = 2
                             }
            if (number==2){
                instructionlabel.text = "TILT DOWN"
             animatelabel(label: instructionlabel)
                instruction = 3
            }
            if (number==3){
                instructionlabel.text = "TILT UP"
             animatelabel(label: instructionlabel)
                instruction = 4
            }
            if (number==4){
                instructionlabel.text = "TWIST RIGHT"
             animatelabel(label: instructionlabel)
                instruction = 5
            }
            if (number==5){
                instructionlabel.text = "TWIST LEFT"
             animatelabel(label: instructionlabel)
                instruction = 6
            }
       
                   if (number==6){
                              instructionlabel.text = "TAP IT"
                    animatelabel(label: instructionlabel)
                        instruction = 7
                          }
           
                   
        }
        func zpos()
        {            //print("zpos")
            action = 1
             checkAction(check: self.instruction)
            let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                      
                       lightImpactFeedbackGenerator.prepare()

                      
                       lightImpactFeedbackGenerator.impactOccurred()
            
            
    }
    func zneg() {        //print("zn")
        action = 2
         checkAction(check: self.instruction)
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                 
                   lightImpactFeedbackGenerator.prepare()

                  
                   lightImpactFeedbackGenerator.impactOccurred()
       
    }
       
    func xpos() {        //print("Xpos")
          action = 3
        checkAction(check: self.instruction)
          let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                    
                     lightImpactFeedbackGenerator.prepare()

                    
                     lightImpactFeedbackGenerator.impactOccurred()
       
      }
    func xneg() {        //print("xne")
          action = 4
        checkAction(check: self.instruction)
          let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                    
                     lightImpactFeedbackGenerator.prepare()

                    
                     lightImpactFeedbackGenerator.impactOccurred()
      
      }
    func ypos() {        //print("ypos")
          action = 5
        checkAction(check: self.instruction)
          let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                    
                     lightImpactFeedbackGenerator.prepare()

                    
                     lightImpactFeedbackGenerator.impactOccurred()
       
      }
    func yneg() {        //print("yneg")
          action = 6
        checkAction(check: self.instruction)
          let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                    
                     lightImpactFeedbackGenerator.prepare()

                    
                     lightImpactFeedbackGenerator.impactOccurred()
       
      }
        func tap() {self.motionManager.stopGyroUpdates()
            action = 7
            checkAction(check: self.instruction)
           let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

           // Prepare shortly before playing
           lightImpactFeedbackGenerator.prepare()

           // Play the haptic signal
           lightImpactFeedbackGenerator.impactOccurred()
           
            
         
           
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          for touch in (touches) {
                     let positionInScene = touch.location(in: self)
                     let touchedNode = self.atPoint(positionInScene)
                     if let name = touchedNode.name {
                         if name == "player" {
                          tap()
                          
                         }
                       
            
            }}}
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
          
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
           
        }
        
        
    override func update(_ currentTime: TimeInterval) {
      
        }
    }
