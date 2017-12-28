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

    func getPixelColor(pos:CGPoint) -> UIColor? {
        let imageDataProvider = self.cgImage?.dataProvider

        let pixelData = imageDataProvider?.data
        let data:UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        print("data = \(data) + \(data[0])")
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor.init(red: r, green: g, blue: b, alpha: a)
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
        
        let pixelData:UnsafeMutablePointer<CGFloat> = UnsafeMutablePointer<CGFloat>.allocate(capacity: 4)
        pixelData.initialize(from: [0.0, 0.0, 0.0, 0.0], count: 4)
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: pixelData, width: 1, height: 1, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        context?.setBlendMode(.copy)
        
        // Draw the pixel we are interested in onto the bitmap context
        context?.translateBy(x: -pointX, y: pointY - height)
        context?.draw(cgImage!, in: CGRect(x: 0, y: 0, width: width, height: height ))

        // Convert color values [0..255] to floats [0.0..1.0]
        let red = pixelData[0] / 255.0;
        let green = pixelData[1] / 255.0;
        let blue = pixelData[2] / 255.0;
        let alpha = pixelData[3] / 255.0;
        
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
            // [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    
    
}
