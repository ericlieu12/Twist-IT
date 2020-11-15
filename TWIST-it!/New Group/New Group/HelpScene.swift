//
//  HelpScene.swift
//  ShakeMe2
//
//  Created by user on 7/24/20.
//  Copyright © 2020 eric. All rights reserved.
//

import SpriteKit
import GameplayKit

class HelpScene: SKScene {
    var viewController: MenuViewController!
    var settingslbl = SKLabelNode(fontNamed: "Qikki Reg")
    var twistleftlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var twistrightlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var rotateleftlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var rotaterightlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var tiltuplbl = SKLabelNode(fontNamed: "Qikki Reg")
    var tiltdownlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var instructionlbl = SKLabelNode(fontNamed: "Qikki Reg")
    var home: SKSpriteNode!
    override func didMove(to view: SKView) {
       home = childNode(withName: "home") as? SKSpriteNode
    settingslbl.text = "HELP"
          settingslbl.position = CGPoint(x:0, y:600)
          settingslbl.zPosition = 3
          settingslbl.fontSize = 150
          settingslbl.fontColor = UIColor.black
        addChild(settingslbl)
        twistleftlbl.text = "TWIST LEFT"
                 twistleftlbl.position = CGPoint(x:-260, y:250)
                 twistleftlbl.zPosition = 3
                 twistleftlbl.fontSize = 50
                 twistleftlbl.fontColor = UIColor.black
               addChild(twistleftlbl)
        twistrightlbl.text = "TWIST RIGHT"
                        twistrightlbl.position = CGPoint(x:-260, y:100)
                        twistrightlbl.zPosition = 3
                        twistrightlbl.fontSize = 50
                        twistrightlbl.fontColor = UIColor.black
                      addChild(twistrightlbl)
        rotateleftlbl.text = "ROTATE LEFT"
          rotateleftlbl.position = CGPoint(x:-260, y:-50)
          rotateleftlbl.zPosition = 3
          rotateleftlbl.fontSize = 50
          rotateleftlbl.fontColor = UIColor.black
        addChild(rotateleftlbl)

        rotaterightlbl.text = "ROTATE RIGHT"
          rotaterightlbl.position = CGPoint(x:-260, y:-200)
          rotaterightlbl.zPosition = 3
          rotaterightlbl.fontSize = 50
          rotaterightlbl.fontColor = UIColor.black
        addChild(rotaterightlbl)

        tiltuplbl.text = "TILT UP"
          tiltuplbl.position = CGPoint(x:-260, y:-350)
          tiltuplbl.zPosition = 3
          tiltuplbl.fontSize = 50
          tiltuplbl.fontColor = UIColor.black
        addChild(tiltuplbl)

        tiltdownlbl.text = "TILT DOWN"
          tiltdownlbl.position = CGPoint(x:-260, y:-500)
          tiltdownlbl.zPosition = 3
          tiltdownlbl.fontSize = 50
          tiltdownlbl.fontColor = UIColor.black
        addChild(tiltdownlbl)
        instructionlbl.text = "HOW TO COMPLETE EACH TASK!!!"
               instructionlbl.position = CGPoint(x:0, y:400)
               instructionlbl.zPosition = 3
               instructionlbl.fontSize = 50
               instructionlbl.fontColor = UIColor.black
             addChild(instructionlbl)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       for touch in (touches) {
                  let positionInScene = touch.location(in: self)
                  let touchedNode = self.atPoint(positionInScene)
                  if let name = touchedNode.name {
                     
                    if name == "home"
                    {  home.texture = SKTexture(imageNamed: "home1")
                        viewController.menusceneload()
                    }
               
         }
        
    }}
}
