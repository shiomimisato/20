//
//  ViewController.swift
//  20
//
//  Created by tech-camp on 2016/08/20.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var sitesScrollView: UIScrollView!
    
    let myyellow = UIColor(red: 174 / 255, green: 255 / 255, blue: 58 / 255, alpha: 1.0)
    let blue = UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    let yellow = UIColor(red: 105.0 / 255, green: 207.0 / 255, blue: 153.0 / 255, alpha: 1.0)
    let red = UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    let black = UIColor(red: 50.0 / 255, green: 56.0 / 255, blue: 60.0 / 255, alpha: 1.0)
    
    let a :[String] = ["ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ", "いいいいいいいいいいい", "うう", "えええええ", "おおおおおおおおおおおおお"]
    let b :[String] = ["かかかかかかかかか", "ききききききききききききききききききききき", "くくくく", "けけけけけけけけけけけけけ", "こここここここここここここ", "ささささささささささ", "ししししししししししししし"]
    let c :[String] = ["すすす", "せせせせせせせせせせせせ", "そそそそそそそそそそそ", "たたたたたたたた", "ちちち"]
    let d :[String] = ["つつつつつつ", "ててて", "とととととととと", "ななななな", "にににににに", "ぬぬぬぬぬぬぬぬぬぬぬ"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sitesScrollView.delegate = self
        self.sitesScrollView.contentSize = CGSizeMake(self.view.frame.width * 4, self.sitesScrollView.frame.height)
        self.sitesScrollView.pagingEnabled = true
        
        //setArticleTableViewに代入する値、4ページ分
        setArticleTableView(0, data:a )
        setArticleTableView(self.view.frame.width, data:b )
        setArticleTableView(self.view.frame.width * 2, data:c )
        setArticleTableView(self.view.frame.width * 3, data:d )
        
        
        setTabButton(self.view.frame.width/8, text:"1", color: blue, tag: 1)
        setTabButton(self.view.frame.width/8 * 3, text:"2", color: red, tag: 2)
        setTabButton(self.view.frame.width/8 * 5, text:"3", color: yellow, tag: 3)
        setTabButton(self.view.frame.width/8 * 7, text:"4", color:  black, tag: 4)
        
    }
    
    
    func setArticleTableView(x: CGFloat,data: Array<String>) {
        let frame = CGRectMake(x, 0, self.view.frame.width, sitesScrollView.frame.height)
        let articleTableView = ArticleTableView(frame: frame, style: UITableViewStyle.Plain)
        articleTableView.data = data
        //セルの高さ可変.ArticleTableView内のheightForRowAtIndexPathの記載いらない。
        articleTableView.estimatedRowHeight = 50
        articleTableView.rowHeight = UITableViewAutomaticDimension
        sitesScrollView.addSubview(articleTableView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ボタンを管理するための配列を定義
    var tabButtons:Array<UIButton> = []
    
    //ボタン,カラーも設定
    func setTabButton(x: CGFloat, text: String, color: UIColor, tag: Int){
        let tabButton = UIButton()
        tabButton.frame.size = CGSizeMake(36, 36)
        tabButton.center = CGPointMake(x, 50)
        tabButton.setTitle(text, forState: UIControlState.Normal)
        tabButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        //ボタンをselecedの時
        tabButton.setTitleColor(color, forState: UIControlState.Selected)
        tabButton.titleLabel?.font = UIFont(name: "HirakakuProN-W6", size: 13)
        tabButton.backgroundColor = myyellow
        tabButton.tag = tag
        // ボタンがタップされた時にtapTabButtonという名前のメソッドを呼び出すように設定
        tabButton.addTarget(self, action: #selector(ArticleViewController.tapTabButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        tabButton.layer.cornerRadius = 18
        tabButton.layer.borderColor = UIColor.whiteColor().CGColor
        tabButton.layer.borderWidth = 1
        tabButton.layer.masksToBounds = true
        self.headerView.addSubview(tabButton)
        tabButtons.append(tabButton)
    }
    
    //ボタンがタップされた時
    func tapTabButton(sender: UIButton){
        let pointX = self.view.frame.width * CGFloat(sender.tag - 1)
        sitesScrollView.setContentOffset(CGPointMake(pointX, 0), animated: true)
    }
    //ボタンを押したら→自動スクロール。終了時に呼ばれる
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        
        for num in 0..<4 {
            if page == CGFloat(num) {
                setSelectedButton(tabButtons[num], selected: true)
            } else {
                setSelectedButton(tabButtons[num], selected: false)
            }
        }
    }
    
    //ドラッグでのスクロールが終了時に呼ばれる
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        for num in 0..<4 {
            if page == CGFloat(num) {
                setSelectedButton(tabButtons[num], selected: true)
            } else {
                setSelectedButton(tabButtons[num], selected: false)
            }
        }
    }
    
    func setSelectedButton(button: UIButton, selected: Bool) {
        button.selected = selected
        button.layer.borderColor = button.titleLabel?.textColor.CGColor
    }
    
 
}

