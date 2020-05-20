//
//  YOHomeSystemCollectionViewCell.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/19.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOHomeSystemCollectionViewCell: UICollectionViewCell {
    
    
    private var iconView:UIImageView = {
        
        let avertIocn = UIImageView()
        let image = UIImage(named: "msg_systerm")
        avertIocn.image = image
        return avertIocn
        
    }()
    
    
    private var titleLabel:UILabel = {
       
        let titLabel = UILabel()
        titLabel.textAlignment = .left
        titLabel.textColor = .colorWithHexStringWithoutAlpha("0x333333")
        titLabel.font = UIFont.systemFont(ofSize: 16)
        titLabel.text = "系统消息"
        return titLabel
    }()
    
    
    
    private var detailLabel:UILabel = {
       
        let xiangqinglabel = UILabel()
        xiangqinglabel.text = "暂无数据"
        xiangqinglabel.textColor = .lightGray
        xiangqinglabel.font = UIFont.systemFont(ofSize: 14)
    
        return xiangqinglabel
    }()
    
    
    
    private var redPotLabel:UILabel = {
        
        let rotPod = UILabel()
        rotPod.backgroundColor = .red
        rotPod.layer.cornerRadius = 8
        rotPod.clipsToBounds = true
        rotPod.textAlignment = .center
        rotPod.textColor = .white
        rotPod.font = UIFont.systemFont(ofSize: 12)
        rotPod.text = "2"
        return rotPod
    }()
    
    
    private var lineView:UIView = {
       
        let bottomline = UIView()
        bottomline.backgroundColor = .colorWithHexStringWithoutAlpha("0xf2f2f2")
        return bottomline
    
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpChildUI()
    }
    
    
    
    func setUpChildUI()  {
        
        self.contentView.addSubview(self.iconView)
        self.iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.iconView.snp_right).offset(10)
            make.top.equalTo(self.iconView.snp_top).offset(5)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(16)
            
        }
        
        self.contentView.addSubview(self.detailLabel)
        self.detailLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.titleLabel)
            make.top.equalTo(self.titleLabel.snp_bottom).offset(10)
            make.height.equalTo(14)
        }
        
        self.contentView.addSubview(self.redPotLabel)
        self.redPotLabel.snp.makeConstraints { (make) in
         
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(16)
        }
        
        
        self.contentView.addSubview(self.lineView)
        self.lineView.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.titleLabel)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            
        }
        
        
    }
    
    
    var systemModel:BlueModel?{
        
        didSet{
            
            guard let model = systemModel else {
                
                return
            }
            
            self.detailLabel.text = model.title
            self.redPotLabel.text = model.noReadNum
    
        }
        
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
}
