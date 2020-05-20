//
//  YOHomeChatItemCollectionViewCell.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/19.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOHomeChatItemCollectionViewCell: UICollectionViewCell {
    
    
    private var iconView:UIImageView = {
      
        let avertyView = UIImageView()
        avertyView.layer.cornerRadius = 4
        avertyView.clipsToBounds = true
        avertyView.layer.borderColor = UIColor.colorWithHexStringWithoutAlpha("0xf2f2f2").cgColor
        let placeImage = UIImage(named: "男icon")
        avertyView.image = placeImage
        avertyView.layer.borderWidth = 0.5
        return avertyView
    }()
    
    
    
    private var nameLabel:UILabel = {
        
        let patientNameLabel = UILabel()
        patientNameLabel.textAlignment = .left
        patientNameLabel.textColor = .colorWithHexStringWithoutAlpha("0x333333")
        patientNameLabel.font = UIFont.systemFont(ofSize: 16)
        patientNameLabel.text = "张三王二麻子"
        return patientNameLabel
 
    }()
    
    
    
    private var detailLabel:UILabel = {
        
        let xiangqinglabel = UILabel()
        xiangqinglabel.text = "暂无数据"
        xiangqinglabel.textColor = .lightGray
        xiangqinglabel.font = UIFont.systemFont(ofSize: 14)
   
        return xiangqinglabel
        
    }()
    
    
    private var lineView:UIView = {
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .colorWithHexStringWithoutAlpha("0xf2f2f2")
        return bottomLine

    }()
    
    
    private var timeLabel:UILabel = {
        
        let showTimeLabel = UILabel()
        showTimeLabel.textAlignment = .right
        showTimeLabel.textColor = .colorWithHexStringWithoutAlpha("0x999999")
        showTimeLabel.font = UIFont.systemFont(ofSize: 11)
        showTimeLabel.text = "上午 12:24"
        return showTimeLabel
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

       setupChildUI()
    }
    
    
    func setupChildUI() {
        
        self.contentView.addSubview(self.iconView)
        self.iconView.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        self.contentView.addSubview(self.nameLabel)
       self.nameLabel.snp.makeConstraints { (make) in
           
           make.left.equalTo(self.iconView.snp_right).offset(10)
           make.top.equalTo(self.iconView.snp_top).offset(5)
           make.right.equalToSuperview().offset(-15)
           make.height.equalTo(16)
       }
        
        self.contentView.addSubview(self.detailLabel)
        self.detailLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp_bottom).offset(10)
            make.height.equalTo(14)
            
        }
        
        
        self.contentView.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.nameLabel)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            
        }
        
        self.contentView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(self.nameLabel.snp_centerY)
 
        }
        
    }
    
    var itemModel:HomeChatItemModel?{
        
        didSet{
            
            guard let model = itemModel  else {
                return
            }
           
            self.nameLabel.text = model.patientName
            self.iconView.kf.setImage(with: URL.init(string: model.patientIconUrl!))
            self.detailLabel.text = model.msgContent
            self.timeLabel.text = model.sendTime
            
            
            
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
    
    
    
}
