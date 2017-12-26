//
//  BaseTabBarController.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

var tabBarHeight = 83.0


class BaseTabBarController: UITabBarController {
    
    var defaultTabBar = BaseTabBar()
    
    static let sharedInstance = BaseTabBarController()

//    override var tabBar: UITabBar {
//        get {
//            return defaultTabBar
//        }
//
//        set(newTab) {
//            if newTab is BaseTabBar {
//                defaultTabBar = newTab as! BaseTabBar
//            } else {
//                print("incorrect chassis type for racecar")
//            }
//        }
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultTabBar = BaseTabBar.init(frame: CGRect(x:0,y:0,width:320,height:49))
        defaultTabBar.centerIndex = 2
        self.setValue(defaultTabBar,forKey:"tabBar")
        setUpTabBarViewControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTabBarViewControllers () {
        let homeVC = HomeViewController()
        let homeNav = BaseNavigationController(rootViewController: homeVC)
        homeNav.tabBarItem.title = "首页"
        homeNav.tabBarItem.image = #imageLiteral(resourceName: "home")
        homeNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "press-home")
        
        let picVC = FriendViewController()
        let picNav = BaseNavigationController(rootViewController: picVC)
        picNav.tabBarItem.title = "展示"
        picNav.tabBarItem.image = #imageLiteral(resourceName: "pic")
        picNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "press-pic")

        let infoVC = ShowViewController()
        let infoNav = BaseNavigationController(rootViewController: infoVC)
        infoNav.tabBarItem.title = "资料"
        infoNav.tabBarItem.image = #imageLiteral(resourceName: "study")
        infoNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "press-study")

        let accountVC = SettingViewController()
        let accountNav = BaseNavigationController(rootViewController: accountVC)
        accountNav.tabBarItem.title = "设置"
        accountNav.tabBarItem.image = #imageLiteral(resourceName: "people")
        accountNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "press-people")

//        let centerVc = CenterViewController()
//        let centerNav = BaseNavigationController(rootViewController: centerVc)
//        centerNav.tabBarItem.title = "center"
//        centerNav.tabBarItem.image = #imageLiteral(resourceName: "center")
//        centerNav.tabBarItem.selectedImage = #imageLiteral(resourceName: "press-center")
        
        self.viewControllers = [homeNav,picNav,infoNav,accountNav]

    }
    

    // MARK: - delegate
    
    

}
