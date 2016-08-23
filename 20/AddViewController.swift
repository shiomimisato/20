//
//  AddViewController.swift
//  20
//
//  Created by tech-camp on 2016/08/21.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var addTextView: UITextView!
    @IBOutlet weak var addTextField: UITextField!
    
    var articleStocks = ArticleStocks.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextView.layer.cornerRadius = 3
        addTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        addTextView.layer.borderWidth = 2
        
        //textViewの編集上からできるように
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"閉じる", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddViewController.close))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddViewController.save))
        
    }
    
    func save () {
        if addTextView.text!.isEmpty {
            let alertView = UIAlertController(title: "だめ", message: "書いてから保存して", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: nil))
            //アラートビューを追加する
            self.presentViewController(alertView, animated: true, completion: nil)
        } else {
            let article = Article(text: addTextView.text!)
            self.articleStocks.upArticleStocks(article)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func  close () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
