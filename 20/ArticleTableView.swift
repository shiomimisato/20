//
//  ArticleTableView.swift
//  20
//
//  Created by tech-camp on 2016/08/20.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class ArticleTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var siteText: String!
    var color: UIColor!

    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        
        //xibファイルの登録
        self.registerNib(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    //セル数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                   return 10//とりあえず
        }

    //cellの内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("ArticleTableViewCell", forIndexPath: indexPath) as! ArticleTableViewCell
            return cell
        }
    
    //セルの高さ UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 85
        }
}