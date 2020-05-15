//
//  YONavBarView.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/11.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YONavBarView: UIView {

    var backButton: UIButton!
    var titleLabel: UILabel!
    var bottomLine: UILabel!
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
         creatUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        
        
        let statusHeight = YOIphoneXAdapter.getTheStatusBarHeight()
        
        backButton = UIButton(frame: CGRect(x: 0, y: 2 + statusHeight, width: 50, height: 30))
        backButton.setImage(UIImage(named: "login_back_gray"), for: .normal)
        backButton.backgroundColor = .colorWithHexStringWithoutAlpha("0xffffff")
        backButton.imageEdgeInsets = .init(top: 0, left: -5, bottom: 0, right: 5)
        self.addSubview(backButton)
        
        
        titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 50, y: 2 + statusHeight, width: K_ScreenWidth - 100, height: 30)
        titleLabel.textColor = .colorWithHexStringWithoutAlpha("0x111111")
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        
        
        bottomLine = UILabel(frame: CGRect(x: 0, y: self.frame.maxY - 1, width: K_ScreenWidth, height: 1))
        bottomLine.backgroundColor = .colorWithHexStringWithoutAlpha("0xefefef")
        self.addSubview(bottomLine)

    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
