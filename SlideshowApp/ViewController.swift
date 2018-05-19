//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mayuka on 2018/05/19.
//  Copyright © 2018年 miriaria0427. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //画像の名前の配列を用意
    let imageNameArray = ["sakura1.JPG","sakura2.JPG","sakura3.JPG","sakura4.JPG"]
    
    //要素数保存用変数
    //var maximageArray : Int! = self.imageNameArray.count
    
    //表示している画像の番号
    var dispImageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //画像ファイルの読み込み
        let image1 = UIImage(named:imageNameArray[dispImageNumber])
        
        //ImageViewに画像を設定
        imageView.image = image1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //戻るボタン押下時のイベント
    @IBAction func onPrev(_ sender: Any) {
        //現在のdispImageNumberの値を確認する
        if(dispImageNumber > 0 && dispImageNumber <= 3){
            
        }
    }
    
    //再生/停止ボタン押下時のイベント
    @IBAction func reStart(_ sender: Any) {
    }
    
    //進むボタン押下時のイベント
    @IBAction func onNext(_ sender: Any) {
        //現在のdispImageNumberの値を確認する
        if(dispImageNumber < 3){
        //3以下ならdispImageNumberをプラス１する
        self.dispImageNumber += 1
        }else{
        //それ以外ならdisImageNumberに0を設定(1番目の画像に戻る）
        self.dispImageNumber = 0
        }
        
        //配列から該当の番号の要素を取り出して読み込み
        let image2 = UIImage(named:imageNameArray[dispImageNumber])
        
        //ImageViewに画像を設定
        imageView.image = image2
    }
    
}

