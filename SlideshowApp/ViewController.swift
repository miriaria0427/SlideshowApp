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

    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!
    
    //一定の間隔で処理を行うためのタイマー
    var timer:Timer!
    
    //表示している画像の番号
    var dispImageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "sakura1.JPG")
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //戻るボタン押下時のイベント
    @IBAction func onPrev(_ sender: Any) {
        //表示している画像の番号を1減らす
        dispImageNumber -= 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    //再生・停止ボタン押下時のイベント
    @IBAction func reStart(_ sender: Any) {
        //動作中のタイマーを1つに保つために、timerが存在しない場合だけ、タイマーを生成して動作させる
        //再生ボタン押下時(timerが存在しない)
        if self.timer == nil{
        //タイマー作成・始動
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(onTimer), userInfo: nil, repeats: true)
        //戻るボタンをタップ不可にする
        BackButton.isEnabled = false
        //進むボタンをタップ不可にする
        NextButton.isEnabled = false
            
        }else{
            //停止ボタン押下時(timerが存在する）
            self.timer.invalidate() //現在のタイマーを破棄する
            self.timer = nil        //timerを初期化
            
            //戻るボタンをタップ可能にする
            BackButton.isEnabled = true
            //進むボタンをタップ可能にする
            NextButton.isEnabled = true
        }
    }
    
    //進むボタン押下時のイベント
    @IBAction func onNext(_ sender: Any) {
        //表示している番号の番号を1増やす
        dispImageNumber += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    //表示している画像の番号を元に画像を表示する
    func displayImage(){
        //画像の名前の配列
        let imageNameArray = ["sakura1.JPG","sakura2.JPG","sakura3.JPG","sakura4.JPG"]
        
        //画像の番号が正常な範囲を指しているかチェック
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNumber < 0 {
            dispImageNumber = 3
        }
        
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNumber > 3 {
            dispImageNumber = 0            
        }
        
        //画像の読み込み
        let image = UIImage(named:imageNameArray[dispImageNumber])
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    @objc func onTimer(timer: Timer){
        //表示している画像の番号を1増やす
        dispImageNumber += 1
        //表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    //表示されている画像をタップした時のイベント
    @IBAction func onTapimage(_ sender: Any) {
        //segueを利用して画面遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    //遷移先に画像データを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        
        //遷移先のImageViewController宣言しているviewerImgに画像データを渡す
        imageViewController.viewerImg = imageView.image
    }
    
    //他の画面からsegueを使ってきた時に呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}


