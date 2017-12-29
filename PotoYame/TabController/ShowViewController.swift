//
//  ShowViewController.swift
//  PotoYame
//
//  Created by ciefky on 2017/12/25.
//  Copyright © 2017年 ciefky. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = DefaultTheme.labelBlackColor

        let customButn = BaseCustonButton(type: .custom)
        customButn.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        customButn.setImage(#imageLiteral(resourceName: "Rukia"), for: .normal)
        self.view.addSubview(customButn)
        customButn.addTarget(self, action: #selector(applyButtonAction), for: .touchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func applyButtonAction() {
        print("I'm clicked")
    }


}
