//
//  UIViewExtension.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/28.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

extension UIView {
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

}
