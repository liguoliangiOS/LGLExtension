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
        let lglv = LGLView()
        lglv.lgl.set(UIColor.lgl.color(0x000000))
        
     
        
//        let lglv2 = LGLView.lgl.view(20)
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
        label.lgl.setRadius(.allCorners, 10)
        label.lgl.setRadius([.topLeft, .bottomRight], 10)
        //设置圆角和边框
        label.lgl.setBorderRadius(10, true, color1, 2)
        
       
    }
}
