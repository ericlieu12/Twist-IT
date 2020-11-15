//
//  MenuViewController.swift
//  ShakeMe2
//
//  Created by user on 7/21/20.
//  Copyright © 2020 eric. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
           super.viewDidLoad()
           
menusceneload()
          
       }
    func menusceneload() {
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                             
                              lightImpactFeedbackGenerator.prepare()

                             
                              lightImpactFeedbackGenerator.impactOccurred()
        if let view = self.view as! SKView? {
                            // Load the SKScene from 'GameScene.sks'
                         if let scene = MenuScene(fileNamed: "MenuScene") {
                                // Set the scale mode to scale to fit the window
                                scene.scaleMode = .aspectFill
                             if let menuscene = scene as? MenuScene {
                                 menuscene.viewController = self}
                                // Present the scene
                            view.presentScene(scene, transition: SKTransition.doorsCloseVertical(withDuration: 0.5))
                            
                             
                            }
                         
                     

                            view.ignoresSiblingOrder = true
                            
                           
                     
                        }
    }
    func helpsceneload() {
        if let view = self.view as! SKView? {
            let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                                 
                                  lightImpactFeedbackGenerator.prepare()

                                 
                                  lightImpactFeedbackGenerator.impactOccurred()
                            // Load the SKScene from 'GameScene.sks'HelpScene.swift
                         if let scene = HelpScene(fileNamed: "HelpScene") {
                                // Set the scale mode to scale to fit the window
                                scene.scaleMode = .aspectFill
                             if let menuscene = scene as? HelpScene {
                                 menuscene.viewController = self}
                                // Present the scene
                            view.presentScene(scene, transition: SKTransition.flipVertical(withDuration: 0.5))
                            
                             
                            }
                         
                     

                            view.ignoresSiblingOrder = true
                            
                          
                     
                        }
    }
    func recordssceneload() {
       
        if let view = self.view as! SKView? {
                            // Load the SKScene from 'GameScene.sks'
                         if let scene = RecordsScene(fileNamed: "RecordsScene") {
                                // Set the scale mode to scale to fit the window
                                scene.scaleMode = .aspectFill
                             if let menuscene = scene as? RecordsScene {
                                 menuscene.viewController = self}
                                // Present the scene
                            view.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: 0.5))
                            
                             
                            }
                         
                     

                            view.ignoresSiblingOrder = true
                            
                        
                     
                        }
    }
    func settingssceneload() {
       let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                            
                             lightImpactFeedbackGenerator.prepare()

                            
                             lightImpactFeedbackGenerator.impactOccurred()
                   if let view = self.view as! SKView? {
                               // Load the SKScene from 'GameScene.sks'
                            if let scene = SettingsScene(fileNamed: "SettingsScene") {
                                   // Set the scale mode to scale to fit the window
                                   scene.scaleMode = .aspectFill
                                if let menuscene = scene as? SettingsScene {
                                    menuscene.viewController = self}
                                   // Present the scene
                                   view.presentScene(scene, transition: SKTransition.flipVertical(withDuration: 0.5))
                                
                               }
                            
                        

                               view.ignoresSiblingOrder = true
                               
                              
                        
                           }
       }
    func gamesceneload() {
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                             
                              lightImpactFeedbackGenerator.prepare()

                             
                              lightImpactFeedbackGenerator.impactOccurred()
        if let view = self.view as! SKView? {
                  // Load the SKScene from 'GameScene.sks'
                  if let scene = GameScene(fileNamed: "GameScene") {
                      // Set the scale mode to scale to fit the window
                      scene.scaleMode = .aspectFill
                      if let gamescene = scene as? GameScene {
                                       gamescene.viewController = self}
                      // Present the scene
                      view.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: 0.5))
                      
                  }
                 
                  view.ignoresSiblingOrder = true
                  
               
              }
    }
    func profilesceneload() {
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                             
                              lightImpactFeedbackGenerator.prepare()

                             
                              lightImpactFeedbackGenerator.impactOccurred()
        if let view = self.view as! SKView? {
                  // Load the SKScene from 'GameScene.sks'
                  if let scene = ProfileScene(fileNamed: "ProfileScene") {
                      // Set the scale mode to scale to fit the window
                      scene.scaleMode = .aspectFill
                      if let gamescene = scene as? ProfileScene {
                                       gamescene.viewController = self}
                      // Present the scene
                     view.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: 0.5))
                      
                  }
                 
                  view.ignoresSiblingOrder = true
                  
            
              }
    }
    override var prefersStatusBarHidden: Bool {
               return true
           }
}
