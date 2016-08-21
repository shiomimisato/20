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
    var data: Array<String> = [] //！でも可。箱を用意しただけではダメで、何かしら入れてあげる必要あり。

    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style )
        
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
        return self.data.count
    }

    //cellの内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ArticleTableViewCell", forIndexPath: indexPath) as! ArticleTableViewCell
            cell.siteText!.text! = data[indexPath.row] //セルの中に情報を入れてあげる
            return cell
        }
    
    //セルの高さ UITableViewDelegate
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//            return 45
//        }
}