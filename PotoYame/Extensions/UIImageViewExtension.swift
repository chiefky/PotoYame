//
//  UIImageViewExtension.swift
//  PotoYame
//
//  Created by ciefky on 2018/1/5.
//  Copyright © 2018年 ciefky. All rights reserved.
//

import UIKit
extension UIImageView {
    
    func viewToImageTransform() -> CGAffineTransform {
        
        let contentMode = self.contentMode
        
        // failure conditions. If any of these are met – return the identity transform
        let condition = self.image == nil || self.frame.size.width == 0 || self.frame.size.height == 0 || (contentMode != .scaleToFill && contentMode != .scaleAspectFill && contentMode != .scaleAspectFit )
        
        if condition {
            return CGAffineTransform.identity
        }
        
        
        // the width and height ratios
        let rWidth = (self.image?.size.width)! / self.frame.size.width;
        let rHeight = (self.image?.size.height)! / self.frame.size.height;
        
        // whether the image will be scaled according to width
        let imageWiderThanView = rWidth > rHeight;
        
        if (contentMode == .scaleAspectFit || contentMode == .scaleAspectFill) {
            
            // The ratio to scale both the x and y axis by
            let ratio = ((imageWiderThanView && contentMode == .scaleAspectFit) || (!imageWiderThanView && contentMode == .scaleAspectFill)) ? rWidth:rHeight;
            
            // The x-offset of the inner rect as it gets centered
            let xOffset = ((self.image?.size.width)! - (self.frame.size.width*ratio))*0.5;
            
            // The y-offset of the inner rect as it gets centered
            let yOffset = ((self.image?.size.height)! - (self.frame.size.height*ratio))*0.5;
            
            return CGAffineTransform(scaleX: ratio, y: ratio).concatenating(CGAffineTransform(translationX: xOffset, y: yOffset));
        } else {
            return CGAffineTransform(scaleX: rWidth, y: rHeight);
        }

    }
    
    func imageToViewTransform() -> CGAffineTransform {
        return self.viewToImageTransform().inverted();
    }
}
