//
//  YOLoginChooseViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/11.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import SnapKit

class YOLoginChooseViewController: YOBaseViewController {

    
    
    var protocolUrl:String?
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navBar.removeFromSuperview()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    
        creatMainUI()
        getProtocol()

        
    }

    /**
     *相关页面的初始化
     */
    private func creatMainUI() {
        
        
        let flagImage = UIImage.init(named: "loginFlag")
        let leftX = (K_ScreenWidth - flagImage!.size.width)/2
        let flagImageView = UIImageView.init(frame: CGRect(x: leftX, y: YOIphoneXAdapter.returnTheNavagationBarHeight() + 42, width: flagImage!.size.width, height: flagImage!.size.height))
        flagImageView.image = flagImage!
        self.view.addSubview(flagImageView)
        
        
        
        let loginButton = UIButton(frame: CGRect(x: 40, y: flagImageView.frame.maxY + 75, width: K_ScreenWidth - 80, height: 44))
        loginButton.backgroundColor = k_CarQIColor
        loginButton.layer.cornerRadius = 22.0
        loginButton.clipsToBounds = true
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.addTarget(self, action: #selector(pressLoginAction), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        
        
        let registerButton = UIButton(frame: CGRect(x: 40, y: loginButton.frame.maxY + 24, width: loginButton.frame.size.width, height: loginButton.frame.size.height))
        registerButton.backgroundColor = UIColor.colorWithHexStringWithoutAlpha("0xffffff")
        registerButton.layer.cornerRadius = 22.0
        registerButton.clipsToBounds = true
        registerButton.layer.borderColor = k_CarQIColor.cgColor
        registerButton.layer.borderWidth = 1;
        registerButton.setTitle("新用户注册", for: .normal)
        registerButton.setTitleColor(k_CarQIColor, for: .normal)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        registerButton.addTarget(self, action: #selector(pressRegisterAction), for: .touchUpInside)
        self.view.addSubview(registerButton)

        
        
        let firstString = "注册/登录即代表同意"
        let serviceProtocolString = "《医生助手服务协议》"
        let privatePolocy = "《隐私政策》"
        
        
        let firstWidth = (firstString as NSString).stringWithFrontReturnSize(size: CGSize(width: K_ScreenWidth, height: CGFloat(MAXFLOAT)), font: UIFont.systemFont(ofSize: 12)).width
        
        let serviceWidth = (serviceProtocolString as NSString).stringWithFrontReturnSize(size: CGSize(width: K_ScreenWidth, height: CGFloat(MAXFLOAT)), font: UIFont.systemFont(ofSize: 12)).width
        
        let privateWidth = (privatePolocy as NSString).stringWithFrontReturnSize(size: CGSize(width: K_ScreenWidth, height: CGFloat(MAXFLOAT)), font: UIFont.systemFont(ofSize: 12)).width
        
        let protocolLeftX = (K_ScreenWidth - firstWidth - serviceWidth - 5 - privateWidth)/2
        
        let firstLabel = UILabel(frame: CGRect(x: protocolLeftX, y: registerButton.frame.maxY + 24, width: firstWidth, height: 12))
        firstLabel.text = firstString
        firstLabel.font = UIFont.systemFont(ofSize: 12)
        firstLabel.textColor = .colorWithHexStringWithoutAlpha("0x999999")
        self.view.addSubview(firstLabel)
        
        
        let serviceButton = UIButton(frame: CGRect(x: firstLabel.frame.maxX, y: firstLabel.frame.minY, width: serviceWidth, height: 12))
        serviceButton.setTitle(serviceProtocolString, for: .normal)
        serviceButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        serviceButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        serviceButton .addTarget(self, action: #selector(clickServiceprotocol), for: .touchUpInside)
        self.view.addSubview(serviceButton)
        
        
        let protocolButtonLine = UIView(frame: CGRect(x: serviceButton.frame.minX + 7, y: serviceButton.frame.maxY, width: serviceButton.frame.size.width - 14, height: 1))
        protocolButtonLine.backgroundColor = .colorWithHexStringWithoutAlpha("0x333333")
        self.view .addSubview(protocolButtonLine)
        
        
        
        let privateButton = UIButton(frame: CGRect(x: serviceButton.frame.maxX + 5, y: serviceButton.frame.minY, width: privateWidth, height: 12))
        privateButton.setTitle(privatePolocy, for: .normal)
        privateButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        privateButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        self.view.addSubview(privateButton)
        
        
        let policyLine = UIView(frame: CGRect(x: privateButton.frame.minX + 7, y: privateButton.frame.maxY, width: privateButton.frame.size.width - 14, height: 1))
        policyLine.backgroundColor = .colorWithHexStringWithoutAlpha("0x333333")
        self.view .addSubview(policyLine)
        
        
        let serviceString = "遇到问题？您可以联系客服:020-39283394";
        let serviceTelLabel = UILabel()
        serviceTelLabel.frame = CGRect(x: 10, y: K_ScreenHeigth - 50, width: K_ScreenWidth - 20, height: 17)
        serviceTelLabel.textAlignment = .center
        serviceTelLabel.font = UIFont.systemFont(ofSize: 12)
        serviceTelLabel.isUserInteractionEnabled = true
        self.view.addSubview(serviceTelLabel)
        
        
        let serviceStr = NSMutableAttributedString.init(string: serviceString)
        serviceStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.colorWithHexStringWithoutAlpha("0x999999")], range: NSMakeRange(0,13))
        serviceStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.colorWithHexStringWithoutAlpha("0x333333")], range: NSMakeRange(14,11))
        serviceTelLabel.attributedText = serviceStr

        
    }
    
    
    func getProtocol() {
        
        YONewWorkRequestTool.requestTool.getServicePortocolUrl(Task: "APPDESC_URL") { (responseData) in
        
            print("\(responseData.data!)")
            let urldetail  = responseData.data!["appdescUrl"] as! String
            self.protocolUrl = urldetail
        }
        
        
    }
    
    
    
    @objc private func pressLoginAction(){
    
        let loginSwitchVC = YOLoginSwitchViewController()
        self.navigationController?.pushViewController(loginSwitchVC, animated: true)
    
    }
    
    
    @objc private func pressRegisterAction(){
        
        
        
    }
    
    
    @objc private func clickServiceprotocol(){
        
        let serviceVC = YOServiceProtocolViewController()
        serviceVC.clickUrl = self.protocolUrl!
        self.navigationController?.pushViewController(serviceVC, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
