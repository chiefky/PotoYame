//
//  CenterViewController.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/26.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAImage(imageName:String) {
        let image = UIImage(named: imageName)
        
        let size = image?.size
        
        // 平移
        //        UIGraphicsBeginImageContextWithOptions(CGSize(width: ((size?.width)! * 2) ,height: (size?.height)!), false, 0)
        //        image?.draw(at: CGPoint(x:0,y:0))
        //        image?.draw(at:  CGPoint(x:(size?.width)!,y:0))
        
        
        // 裁剪
        UIGraphicsBeginImageContextWithOptions(CGSize(width: ((size?.width)! / 2) ,height: (size?.height)!), false, 0);
        let width = (size?.width)! * (-1.0) / 2.0
        image?.draw(at: CGPoint(x: width,y:0))
        let resultImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageView = UIImageView(image:resultImg)
        self.view.addSubview(imageView)
        imageView.center = self.view.center
        
    }

}
