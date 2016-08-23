//
//  MyPageTableViewController.swift
//  20
//
//  Created by tech-camp on 2016/08/21.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class MyPageTableViewController: UITableViewController {
    
    var articleStocks = ArticleStocks.sharedInstance
    //配列を取り出したいから
    //押されたcellのindexPath.row
    var selectedCellRow:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleStocks.getMyArticles()
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //セルの登録
        self.tableView.registerNib(UINib(nibName: "MyPageTableViewCell", bundle: nil), forCellReuseIdentifier: "MyPageTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleStocks.myArticles.count
    }
    
    //セルの内容
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyPageTableViewCell", forIndexPath: indexPath) as! MyPageTableViewCell
        let myArticle = self.articleStocks.myArticles[indexPath.row]
        cell.myText!.text! = myArticle.text
        return cell
    }
    
    //TableViewのリロード
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //ナビゲーションバーの字の色を変える
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "追加", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MyPageTableViewController.newTodo))
        //削除をつける
        self.navigationItem.leftBarButtonItem = editButtonItem()
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        //画面が表示される度にTableViewをリロードする
        self.tableView.reloadData()
    }
    
    //Editボタン、セルを削除させる
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            self.articleStocks.myArticles.removeAtIndex(indexPath.row)
            self.articleStocks.saveArticle()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Middle)
        default:
            return
        }
    }
    
    //セルを動かす
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = self.articleStocks.myArticles[sourceIndexPath.row]
        self.articleStocks.myArticles.removeAtIndex(sourceIndexPath.row)
        self.articleStocks.myArticles.insert(todo, atIndex: destinationIndexPath.row)
        self.articleStocks.saveArticle()
    }
    
    func newTodo(){
        self.performSegueWithIdentifier("PresentMyPageViewController", sender: self)
    }
    
    //セルをタップしたら編集
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //せるの番号
        self.selectedCellRow = indexPath.row
//        let artcleStock = ArticleStocks()
//        artcleStock.didSelectInsertCell(<#T##article: Article##Article#>, indexPath: indexPath)
        
        //storyboardのセグエを使わない画面遷移
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("Kjjh") as! CellHSViewController
        //送ってる
        controller.sendText = self.articleStocks.myArticles[self.selectedCellRow].text
        controller.indexPathRow = indexPath.row
        let navigationController = UINavigationController(rootViewController: controller)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
        print(articleStocks.myArticles[indexPath.row].text)
    }
    
    
    
    //cellの中身を送る
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if segue.identifier == "GogoMyPageViewController" {
//            
//            let cellHSViewController:CellHSViewController = segue.destinationViewController as! CellHSViewController
//            
//            //selfのarticleStocksクラスのmyArticlesという配列の[self.selectedCellRow]番目.textです。
//
//           cellHSViewController.sendText = self.articleStocks.myArticles[self.selectedCellRow].text
//        }
//    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

