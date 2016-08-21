//
//  ArticleTableViewCell.swift
//  20
//
//  Created by tech-camp on 2016/08/20.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var siteText: UILabel!
    @IBOutlet weak var siteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
//        siteButton.addTarget(self, action: "tapBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
//    func tapBtn(sender :UIButton){
//        var btn = sender as! UIButton
//        var cell = btn.superview!.superview as! UITableViewCell
//    }
}
