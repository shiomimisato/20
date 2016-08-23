//
//  ArticleStocks.swift
//  20hoge
//
//  Created by tech-camp on 2016/08/21.
//  Copyright © 2016年 misato. All rights reserved.
//

import UIKit

class ArticleStocks: NSObject {
    
    //シングルトンな変数
    static let sharedInstance = ArticleStocks()
    //１．ブックマークに追加した記事を管理する配列myArticlesをプロパティとして定義
    var myArticles: Array<Article> = []

    
    //２．配列myArticlesに記事を保存するためのメソッドを定義
    func addArticleStocks(article: Article) {
        //self.myArticles.insert(article, atIndex: 0)
        myArticles.append(article)
        saveArticle()
    }
    
    func upArticleStocks(article: Article) {
        myArticles.insert(article, atIndex: 0)
        saveArticle()
    }
    
    func cellArticleStocks(article: Article, index: Int) {
        myArticles.removeAtIndex(index)
        myArticles.insert(article, atIndex: index)
        saveArticle()
    }
    
    //テストテスト
    
    func saveArticle(){
        var tmpArticles: Array<Dictionary<String, AnyObject>> = []
        for myArticle in self.myArticles {
            let articleDic = ArticleStocks.convertDictionary(myArticle)
            tmpArticles.append(articleDic)
        }
        
        //２．記事の情報をローカルに保存するメソッドの定義
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tmpArticles, forKey: "myArticles")
        defaults.synchronize()
    }
    
    //記事を取得するメソッドを定義
    func getMyArticles(){
        let defaults = NSUserDefaults.standardUserDefaults()
        if let articles = defaults.objectForKey("myArticles") as? Array<Dictionary<String, String>> {
            for dic in articles {
                let article = ArticleStocks.convertArticleModel(dic)
                self.myArticles.append(article)
            }
        }
    }
    
    //ローカルに保存した記事を取得
    class func convertArticleModel(dic: Dictionary<String, String>) -> Article {
        let article = Article(text: dic["text"]!)
        return article
    }
    
    //１．Articleクラスのインスタンスを辞書型に変換するメソッドの定義
    //ローカル保存、辞書型に
    class func convertDictionary(article: Article) -> Dictionary<String, AnyObject>{
        var dic = Dictionary<String, AnyObject>()
        dic["text"] = article.text
        return dic
    }
    
    
}
