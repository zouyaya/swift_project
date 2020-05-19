//
//  YOHomeFuncButton.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/18.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOHomeFuncButton: UIButton {

    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
       
        let image = UIImage(named: "我的药房")
        self.imageView?.frame.size.width = image!.size.width
        self.imageView?.frame.size.height = image!.size.height
        self.imageView?.center.x = self.frame.size.width / 2
        self.imageView?.frame.origin.y = 0
        
        self.titleLabel?.frame.origin.x = 0
        self.titleLabel?.frame.origin.y =  CGFloat((self.imageView!.frame.maxY) + 10)
        self.titleLabel?.frame.size.width = self.frame.size.width;
        self.titleLabel?.frame.size.height = 14
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
