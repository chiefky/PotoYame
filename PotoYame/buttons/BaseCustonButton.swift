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
    func colorAtPonit(point:CGPoint) -> UIColor? {
        let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        // CGBitmapInfo.fromRaw(CGImageAlphaInfo.PremultipliedLast.toRaw())!
        let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.translateBy(x: -point.x, y: -point.y)
        //        CGContextTranslateCTM(context!, -point.x, -point.y)
        self.layer.render(in: context!)
        //        CGContextRelease(context)
        //        CGColorSpaceRelease(colorSpace)
        return UIColor(red: CGFloat(Float(pixel [0]) / 255.0), green: CGFloat(Float (pixel [1]) / 255.0), blue: CGFloat(Float (pixel [2]) / 255.0) , alpha: CGFloat(Float (pixel [3]) / 255.0))
    }
    
    func isAlphaVisableAtPoint(point: CGPoint , image: UIImage) -> Bool {
        var touchPoint = point
        let iSize = image.size;
        let bSize = self.bounds.size;
        touchPoint.x *= (bSize.width != 0) ? (iSize.width / bSize.width) : 1
        touchPoint.y *= (bSize.height != 0) ? (iSize.height / bSize.height) : 1
        let pixelColor = image.getPixelColor(pos: point)?.cgColor // colorAtPonit(point: touchPoint)?.cgColor //  image.colorAtPixel(point: touchPoint)?.cgColor  //  [ CGColor];
        let alpha = pixelColor?.alpha
        return alpha! >= CGFloat(0.1)
    }
    
    
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
        
        let buttonImage = self.image(for: .normal)
        let buttonBackground = self.backgroundImage(for: .normal)
        
        var response = false

        if buttonImage == nil && buttonBackground == nil {
            response = true
        } else if buttonImage != nil && buttonBackground == nil {
            response = self.isAlphaVisableAtPoint(point: point, image: buttonImage!)
        } else if (buttonImage == nil && buttonBackground != nil) {
            response = self.isAlphaVisableAtPoint(point: point, image: buttonBackground!)
        } else {
            if (self.isAlphaVisableAtPoint(point: point, image: buttonImage!)) {
                response = true
            } else {
                response = self.isAlphaVisableAtPoint(point: point, image: buttonBackground!)
            }
        }
        
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
