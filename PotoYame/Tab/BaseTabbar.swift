
//  BaseTabBar.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

class BaseTabBar: UITabBar {
    var plusButnSize = CGSize(width: 60, height: 60)
    var centerIndex = 1
    
     fileprivate lazy var plusBtn:UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y:0, width: plusButnSize.width, height: plusButnSize.height)
        button.setImage(#imageLiteral(resourceName: "center"), for: .normal)
        button.addTarget(self, action: #selector(applyButtonAction) , for: .touchUpInside)
        let color =  UIColor.randomColor(5)
        button.backgroundColor = color
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.barTintColor = DefaultTheme.fontGrayColor
        self.addSubview(self.plusBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        layoutSubviews(centerPlus: true)
    }
    
    func layoutSubviews(centerPlus:Bool) {
        if centerPlus {
            var tabBarButtonArray = [UIView]()
            for view in self.subviews {
                if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                    tabBarButtonArray.append(view)
                }
            }
            
            // 重新布局其他 tabBarItem
            let barWidth = self.bounds.size.width
            let barHeight = self.bounds.size.height
            
            let centButnCenterPoint = CGPoint(x:barWidth / 2, y:barHeight -  plusButnSize.height / 2)
            plusBtn.center = centButnCenterPoint // 设置中间按钮的位置，居中，凸起一丢丢
            let itemsWidth = barWidth - plusButnSize.width // 平均分配其他 tabBarItem 的宽度
            let barItemWidth = itemsWidth / CGFloat(tabBarButtonArray.count)
            for (idx,barButn) in tabBarButtonArray.enumerated() { // 逐个布局 tabBarItem，修改 UITabBarButton 的 frame
                var frame = barButn.frame
                if(idx >= tabBarButtonArray.count / 2) { // 重新设置 x 坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
                    frame.origin.x = CGFloat(idx) * barItemWidth + plusButnSize.width
                } else {
                    frame.origin.x = CGFloat(idx) * barItemWidth
                }
                
                frame.size.width = barItemWidth // 重新设置宽度
                barButn.frame = frame;
            }
            
            self.bringSubview(toFront: plusBtn)
        }
       
    }
    
    @objc func applyButtonAction() {
        print("plus +++ ")
    }

    
    
//    // 重写hitTest方法，让超出tabBar部分也能响应事件
//    - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//    {
//    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
//    return nil;
//    }
//    UIView *result = [super hitTest:point withEvent:event];
//    // 如果事件发生在tabbar里面直接返回
//    if (result) {
//    return result;
//    }
//    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
//    for (UIView *subview in self.subviews) {
//    // 把这个坐标从tabbar的坐标系转为subview的坐标系
//    CGPoint subPoint = [subview convertPoint:point fromView:self];
//    result = [subview hitTest:subPoint withEvent:event];
//    // 如果事件发生在subView里就返回
//    if (result) {
//    return result;
//    }
//    }
//    return nil;
//    }

    
}


