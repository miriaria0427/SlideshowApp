//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by mayuka on 2018/05/20.
//  Copyright © 2018年 miriaria0427. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var closeUpImage: UIImageView!
    
    //遷移先から画像データを受け取るためのプロパティ
    var viewerImg :UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //画像データの表示
        closeUpImage.image = viewerImg

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
