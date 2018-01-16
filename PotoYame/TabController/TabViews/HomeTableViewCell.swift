//
//  HomeTableViewCell.swift
//  PotoYame
//
//  Created by ciefky on 2018/1/2.
//  Copyright © 2018年 ciefky. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    var model:PicItemModel? {
        didSet {
            print("form \(String(describing: oldValue)) to \(String(describing: model))")
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        guard let model = model else {
//            return
//        }
//        
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
