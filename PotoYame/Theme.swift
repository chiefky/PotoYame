//
//  PTTheme.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit


let SCREENWIDTH = UIScreen.main.bounds.width
let SCREENHEIGHT = UIScreen.main.bounds.height
let SCREENSCALE = UIScreen.main.scale
let mSINGLE_LINE_WIDTH = (1 / UIScreen.main.scale) // 1个像素
let mSINGLE_LINE_ADJUST_OFFSET = ((1 / UIScreen.main.scale) / 2) // 1/2 偏移量

let DefaultTheme:Theme = Theme()

struct Theme {
    let themeColor = UIColor(hexValue: 0xffca26,alpha:0.8)
    let titleColor = UIColor(hexValue: 0x999999)
    let subTitleColor = UIColor(hexValue: 0x333333)
    let naviTitleColor = UIColor(hexValue: 0x252525)
    let lightBeigeColor = UIColor(hexValue: 0xfffbee)
    let btnRedColor = UIColor(hexValue: 0xae4c48)
    let viewBackgroundColor = UIColor.white
    let viewGrayColor = UIColor(hexValue: 0xf5f5f5)
    
    let spaceLineColor = UIColor(hexValue: 0xe3e3e3)
    
    let labelBlackColor = UIColor(hexValue: 0x666666)
    
}
