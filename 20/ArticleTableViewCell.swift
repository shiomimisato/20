//
//  ArticleTableViewCell.swift
//  20
//
//  Created by tech-camp on 2016/08/20.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var siteButton: UIButton!
    @IBOutlet weak var siteTextLabel: UILabel!
    
    let articleStocks = ArticleStocks.sharedInstance

    override func awakeFromNib() {
        super.awakeFromNib()
        siteButton.addTarget(self, action: #selector(ArticleTableViewCell.tapBtn(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func tapBtn(sender :UIButton){
        let text = siteTextLabel.text
        let article = Article(text: text!)
        self.articleStocks.addArticleStocks(article)
        
        
//        ArticleStocks.sharedInstance.addArticleStocks(Article(text: siteText.text!))
        
    }
}
