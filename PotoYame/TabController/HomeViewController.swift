//
//  HomeViewController.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = DefaultTheme.viewBackgroundColor
        
        let poto = PotoView()
        poto.frame = CGRect(x: 20, y: 20, width: SCREENWIDTH-40, height: 100)
        self.view.addSubview(poto)
        
        showAImage(imageName: "Rukia")
    
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


        //
        UIGraphicsBeginImageContextWithOptions(CGSize(width: ((size?.width)! / 2) ,height: (size?.height)!), false, 0);
        
        let width = (size?.width)! * (-1.0) / 2.0
        
        image?.draw(at: CGPoint(x: width,y:0))
        let resultImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageView = UIImageView(image:resultImg)
        self.view.addSubview(imageView)
        imageView.center = self.view.center
        
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*2, sz.height), NO, 0);
        
//        [mars drawAtPoint:CGPointMake(0,0)];
        
//        [mars drawAtPoint:CGPointMake(sz.width,0)];
        
//        UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
        
//        UIGraphicsEndImageContext();
        
//        UIImageView* iv = [[UIImageView alloc] initWithImage:im];
        
//        [self.window.rootViewController.view addSubview: iv];
        
//        iv.center = self.window.center;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
