//
//  YOHomeOPerationCollectionViewCell.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/18.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit



enum HomeOPerationType{
    
    case askPatient
    case payConsult
    case medicalCeter
    case appointDiagnose
    case myDroom
    case HuanjiaoCenter
    
}


//添加cell的代理方式
protocol YOHomeOPerationCollectionViewCellDelegate:NSObjectProtocol{
    
    func cellButtonClickWithTheButtonIndex(operateType :HomeOPerationType)
    
    
}

class YOHomeOPerationCollectionViewCell: UICollectionViewCell {
    
    weak var delegate : YOHomeOPerationCollectionViewCellDelegate?
    
    private var askPatientButton:UIButton = {
        
        let askButtOn = UIButton()
        
        askButtOn.layer.borderColor = UIColor.init(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0).cgColor
        askButtOn.layer.borderWidth = 0.5
        askButtOn.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.04).cgColor
        askButtOn.layer.shadowOffset = CGSize(width: 0, height: 2)
        askButtOn.layer.shadowRadius = 4;
        askButtOn.layer.shadowOpacity = 1;
        askButtOn.layer.cornerRadius = 10;
        askButtOn.setImage(UIImage(named: "邀请患者"), for: .normal)
        askButtOn.setTitle("邀请患者", for: .normal)
        askButtOn.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        askButtOn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        askButtOn.titleEdgeInsets = .init(top: 0, left: 5, bottom: 0, right: -5)
        askButtOn.imageEdgeInsets = .init(top: 0, left: -5, bottom: 0, right: 5)
        return askButtOn
   
    }()
    
    
    private var consultButton:UIButton = {
       
        let zixunButton = UIButton()
        zixunButton.layer.borderColor = UIColor.init(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0).cgColor
       zixunButton.layer.borderWidth = 0.5
       zixunButton.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.04).cgColor
       zixunButton.layer.shadowOffset = CGSize(width: 0, height: 2)
       zixunButton.layer.shadowRadius = 4;
       zixunButton.layer.shadowOpacity = 1;
       zixunButton.layer.cornerRadius = 10;
       zixunButton.setImage(UIImage(named: "患者咨询"), for: .normal)
       zixunButton.setTitle("医生助手", for: .normal)
       zixunButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
       zixunButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
       zixunButton.titleEdgeInsets = .init(top: 0, left: 5, bottom: 0, right: -5)
       zixunButton.imageEdgeInsets = .init(top: 0, left: -5, bottom: 0, right: 5)

        return zixunButton
        
    }()
    
    
    
    private var drugRoomButton: YOHomeFuncButton = {
       
        let drugButton = YOHomeFuncButton()
        drugButton.setTitle("我的药房", for: .normal)
        drugButton.setImage(UIImage(named: "我的药房"), for: .normal)
        drugButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        drugButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        return drugButton
        
    }()
    
    
    
    private var medicialCenterButton: YOHomeFuncButton = {
       
        let ceterButton = YOHomeFuncButton()
        ceterButton.setTitle("医学中心", for: .normal)
        ceterButton.setImage(UIImage(named: "知识库"), for: .normal)
        ceterButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        ceterButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        return ceterButton
        
    }()
    
    
    
    
    private var appointButton:YOHomeFuncButton = {
        
        let yuyueButton = YOHomeFuncButton()
        yuyueButton.setTitle("预约就诊", for: .normal)
        yuyueButton.setImage(UIImage(named: "预约就诊"), for: .normal)
        yuyueButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        yuyueButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        return yuyueButton
    }()
    
    
    
    private var huanjiaoCenterButton:YOHomeFuncButton = {
           
           let huanjiaoButton = YOHomeFuncButton()
           huanjiaoButton.setTitle("患教中心", for: .normal)
           huanjiaoButton.setImage(UIImage(named: "患教中心"), for: .normal)
           huanjiaoButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
           huanjiaoButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
           return huanjiaoButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpChildVC()
        
       self.askPatientButton.addTarget(self, action: #selector(askPatientAction(button:)), for: UIControl.Event.touchUpInside)
        
       self.consultButton.addTarget(self, action: #selector(payConsultAction), for: .touchUpInside)
        
        self.medicialCenterButton.addTarget(self, action: #selector(medicalCenterAction), for: .touchUpInside)

        
        self.drugRoomButton.addTarget(self, action: #selector(drugRoomAction), for: .touchUpInside)
        
        self.appointButton.addTarget(self, action: #selector(appointAction), for: .touchUpInside)
        
        self.huanjiaoCenterButton.addTarget(self, action: #selector(huanjiaoAction), for: .touchUpInside)
        
    }
    
    func setUpChildVC() {
        
        self.contentView.addSubview(self.askPatientButton)
        self.askPatientButton.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
            make.right.equalTo(self.contentView.snp_centerX).offset(-8)
            make.height.equalTo(72)
            
        }
        
        self.contentView.addSubview(self.consultButton)
        self.consultButton.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.contentView.snp_centerX).offset(8)
            make.right.equalToSuperview().offset(-15)
            make.top.height.equalTo(self.askPatientButton)
            
        }
        
        self.contentView.addSubview(self.medicialCenterButton)
        self.medicialCenterButton.snp.makeConstraints { (make) in
            
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-24)
            make.top.equalTo(self.askPatientButton.snp_bottom).offset(24)
            make.width.equalTo(K_ScreenWidth/4)
            
        }
        
        
        self.contentView.addSubview(self.drugRoomButton)
        self.drugRoomButton.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.medicialCenterButton.snp_right)
            make.top.bottom.width.equalTo(self.medicialCenterButton)
            
        }
        
        
        self.contentView.addSubview(self.appointButton)
        self.appointButton.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.drugRoomButton.snp_right)
            make.top.bottom.width.equalTo(self.drugRoomButton)
            
        }
        
        self.contentView.addSubview(self.huanjiaoCenterButton)
        self.huanjiaoCenterButton.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.appointButton.snp_right)
            make.top.bottom.width.equalTo(self.appointButton)

        }
        
    }
    
    
    
    
    @objc private func askPatientAction(button:UIButton){
        
        self.delegate?.cellButtonClickWithTheButtonIndex(operateType: .askPatient)
    
    }
    
    
    @objc private func payConsultAction(){
        
        self.delegate?.cellButtonClickWithTheButtonIndex(operateType: .payConsult)
        
    }
    
    @objc private func medicalCenterAction(){
        
        self.delegate?.cellButtonClickWithTheButtonIndex(operateType: .medicalCeter)
    }
    
    @objc private func drugRoomAction(){
        
        self.delegate?.cellButtonClickWithTheButtonIndex(operateType: .myDroom)
        
    }
    
    @objc private func appointAction(){
        
        self.delegate?.cellButtonClickWithTheButtonIndex(operateType: .appointDiagnose)
    }
    
    @objc private func huanjiaoAction(){
        
        self.delegate?.cellButtonClickWithTheButtonIndex(operateType: .HuanjiaoCenter)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
