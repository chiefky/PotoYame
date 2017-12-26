//
//  UIColorExtensions.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(hexValue:UInt,alpha:CGFloat = 1) {
        let r = (hexValue & 0xFF0000) >> 16
        let g = (hexValue & 0xFF00) >> 8
        let b = hexValue & 0xFF
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    static func randomColor(_ random:Int = 0) -> UIColor {
        let randomNum = arc4random()
        let hue = CGFloat((randomNum % 256 + UInt32(random))) / 256.0  //0.0 to 1.0
        let saturation = CGFloat(randomNum % 128 + UInt32(random)) / 256.0 + 0.5  // 0.5 to 1.0,away from white
        let brightness = CGFloat(randomNum % 128 + UInt32(random)) / 256.0 + 0.5  //0.5 to 1.0,away from black
        
        let randomColor = self.init(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        return randomColor
    }
}

