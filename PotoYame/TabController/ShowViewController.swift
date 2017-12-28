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
        customButn.center = self.view.center
        self.view.addSubview(customButn)
        customButn.addTarget(self, action: #selector(applyButtonAction), for: .touchUpInside)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func applyButtonAction() {
        print("I'm clicked")
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
