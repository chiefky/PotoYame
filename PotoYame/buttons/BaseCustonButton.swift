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
    func isAlphaVisableAtPoint(point: CGPoint , image: UIImage) -> Bool {
        // Correction for image scaling including contentmode
        let pt = point.applying(self.imageView!.viewToImageTransform());
        let touchPoint = pt
        
        let pixelUIColor = image.colorAtPixel(point: touchPoint) //image.getPixelColor(pos: touchPoint)?.cgColor // colorAtPonit(point: touchPoint)?.cgColor //  image.colorAtPixel(point: touchPoint)?.cgColor  //  [ CGColor];
        var alpha:CGFloat = 0.0
        pixelUIColor?.getRed(nil, green: nil, blue: nil, alpha:&alpha)
        return alpha >= 0.1
    }
    
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        let superResult = super.point(inside: point, with: event)
        if !superResult {
            return superResult
        }

        
        let result = isAlphaVisableAtPoint(point: point, image: self.currentImage!)
        
        return result
        
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
