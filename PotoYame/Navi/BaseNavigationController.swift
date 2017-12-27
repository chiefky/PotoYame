//
//  BaseNavigationController.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.shadowImage = UIImage(DefaultTheme.themeColor)
        self.navigationBar.shadowImage = UIImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}

extension BaseNavigationController {
    enum BaseNavigationItemStyle {
        case back
        case custom
    }
    
    class func navigationItem(style:BaseNavigationItemStyle = .custom, title:String, target:Any?, selector:Selector) -> UIBarButtonItem{
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        switch style {
        case .custom:
            button.setTitleColor(DefaultTheme.naviTitleColor, for: .normal)
        case .back:
            button.setTitleColor(UIColor(hexValue:0x999999), for: .normal)
        }
        
        button.addTarget(target, action: selector, for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        return item
    }
}
