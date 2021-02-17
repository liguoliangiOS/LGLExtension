//
//  ViewController.swift
//  LGLExtension
//
//  Created by lgliang on 02/16/2021.
//  Copyright (c) 2021 lgliang. All rights reserved.
//

import UIKit
import LGLExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testUILabel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController {
    
    func testUILabel()  {
        //颜色使用一
        let color1 = UIColor.lgl.color(0xFF69B4)
        //颜色使用二
        let color2 = UIColor.lgl.color("#7B68EE")
        
        let font = UIFont.systemFont(ofSize: 16)
        
        //使用方式一
        let label = UILabel.lgl.label("这是UILabel1", color1, font)
        label.frame = CGRect(x: 0, y: 100, width: 160, height: 30)
        label.backgroundColor = color2
        self.view.addSubview(label)
        
        //使用方式二
        let label2 = UILabel()
        label2.lgl.set("这是UILabel2", color2, font)
        label2.frame = CGRect(x: 0, y: 140, width: 160, height: 30)
        label2.backgroundColor = color1
        self.view.addSubview(label2)
        
        //切角
//        label.lgl.radius(.allCorners, 10)
//        label.lgl.radius([.topLeft, .bottomRight], 10)
        
//        label.lgl.borderRadius(<#T##cornerRadius: CGFloat##CGFloat#>, <#T##masksToBounds: Bool##Bool#>, color1, <#T##borderWidth: CGFloat##CGFloat#>)
        label.lgl.borderRadius(10, true, color1, 2)
        
        label2.lgl.horizontalGradientLayer(UIColor.lgl.color("#00FFFF"), UIColor.lgl.color(0x7FFFAA), 10)
        label2.text = "SSSSS"
    }
}
