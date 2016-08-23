//
//  CellHSViewController.swift
//  20
//
//  Created by tech-camp on 2016/08/22.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class CellHSViewController: UIViewController {
    @IBOutlet weak var kjjhLabel: UILabel!
    @IBOutlet weak var kjjhTextView: UITextView!
    
    var articleStocks = ArticleStocks.sharedInstance
    var sendText: String!
    var indexPathRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kjjhTextView.text = sendText
        print(sendText)
        print(indexPathRow)

        kjjhTextView.layer.cornerRadius = 3
        kjjhTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        kjjhTextView.layer.borderWidth = 2
        
        //textViewの編集上からできるように
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"閉じる", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CellHSViewController.close))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CellHSViewController.save))
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 174.0 / 255, green: 255.0 / 255, blue: 58.0 / 255, alpha: 1.0)
        
    }
    
    func save () {
            let article = Article(text: kjjhTextView.text!)
            self.articleStocks.cellArticleStocks(article, index: indexPathRow!)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    
    func  close () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


