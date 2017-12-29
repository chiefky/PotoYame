//
//  BaseCustonButton.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/27.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit
//#define kAlphaVisibleThreshold (0.1f)

class BaseCustonButton: UIButton {
    var previousPoint = CGPoint(x: CGFloat.leastNormalMagnitude,y: CGFloat.leastNormalMagnitude)
    var previousTouchResult = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        resetHitTest()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func resetHitTest() {
        previousPoint = CGPoint(x: CGFloat.leastNormalMagnitude,y: CGFloat.leastNormalMagnitude)
        previousTouchResult = false
    }
    
    // MARK - hit
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        let superResult = super.point(inside: point, with: event)
        if !superResult {
            return superResult
        }

        if __CGPointEqualToPoint(point, previousPoint) {
            return previousTouchResult
        } else {
            previousPoint = point
        }

        let color = self.colorAtPonit(point: point)
        let response = (color?.cgColor.alpha)! >= CGFloat(0.1)
        self.previousTouchResult = response;
        return response
    }
    
    override func setImage(_ image: UIImage?, for state: UIControlState) {
        super.setImage(image, for: state)
        resetHitTest()
    }
    
    override func setBackgroundImage(_ image: UIImage?, for state: UIControlState) {
        super.setBackgroundImage(image, for: state)
        resetHitTest()
    }
}
