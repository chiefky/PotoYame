//
//  PotoView.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/27.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

class PotoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        //获取图形上下文
        let context = UIGraphicsGetCurrentContext()

        /*写文字*/
//        context?.setFillColor(red: 1, green: 0, blue: 0, alpha: 1.0)
//        let text: NSString = "覆寫(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event 的觸發條件"
//        let font = UIFont(name: "Helvetica Bold", size: 17.0)
//
//        let textRect: CGRect = CGRect(x:5, y:3, width:SCREENWIDTH - 40, height:80)
//        let textColor = DefaultTheme.themeColor
//        if let actualFont = font {
//            let textFontAttributes = [
//                NSAttributedStringKey.font: actualFont,
//                NSAttributedStringKey.foregroundColor: textColor,
//            ]
//            text.draw(in: textRect, withAttributes: textFontAttributes)
//        }
        
        /*画圆*/
        //边框圆
        context?.setStrokeColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        context?.setLineWidth(1.0)
        //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
        // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
        context?.addArc(center: self.center, radius: 15, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
//        context.dra
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
