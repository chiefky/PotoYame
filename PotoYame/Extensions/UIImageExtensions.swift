//
//  UIImageExtensions.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(_ color:UIColor, size:CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage:image!.cgImage!,scale:UIScreen.main.scale,orientation: image!.imageOrientation)
    }

    func colorAtPixel(point:CGPoint) -> UIColor? {
        // Cancel if point is outside image coordinates
        let rect = CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height)
        if !rect.contains(point) {
            return nil
        }
    
        // Create a 1x1 pixel byte array and bitmap context to draw the pixel into.
        // Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
        let pointX = trunc(point.x)
        let pointY = trunc(point.y)
        let cgImage = self.cgImage;
        let width = self.size.width;
        let height = self.size.height;
        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let bytesPerPixel = 4;
        let bytesPerRow = bytesPerPixel * 1;
        let bitsPerComponent = 8;
        
        let pixelData:UnsafeMutablePointer<UInt8> = UnsafeMutablePointer<UInt8>.allocate(capacity: 4)
        pixelData.initialize(from: [0, 0, 0, 0], count: 4)
        let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: pixelData, width: 1, height: 1, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.setBlendMode(CGBlendMode.copy)
        
        // Draw the pixel we are interested in onto the bitmap context
        context?.translateBy(x: -pointX, y: pointY - height)
        context?.draw(cgImage!, in: CGRect(x: 0.0, y: 0.0, width: width, height: height ))

        // Convert color values [0..255] to floats [0.0..1.0]
        let red = CGFloat(pixelData[0]) / 255.0;
        let green = CGFloat(pixelData[1]) / 255.0;
        let blue = CGFloat(pixelData[2]) / 255.0;
        let alpha = CGFloat(pixelData[3]) / 255.0;
        
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
}
