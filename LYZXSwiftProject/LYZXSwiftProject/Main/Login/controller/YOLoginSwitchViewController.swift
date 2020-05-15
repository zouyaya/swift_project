//
//  YOLoginSwitchViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/15.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOLoginSwitchViewController: YOBaseViewController {
    
    
    var vertifyLoginButton: UIButton!
    var passwordLoginButton: UIButton!
    var BottomLine: UIView!
    var phoneField: UITextField!
    var phonelineVIew: UIView!
    var vertifyCodeField: UITextField?
    var vertifyCodeButton: UIButton?
    var passwordField: UITextField?
    var secondBottomLineView: UIView!
    var loginButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.navBar.bottomLine.isHidden = true;
        
        initializeViewUI()
        
    }
    
    /**
     *相关页面的初始化
     */
   private func initializeViewUI() {
      
    
        let switchBottonView = UIView(frame: CGRect(x: 0, y: YOIphoneXAdapter.returnTheNavagationBarHeight() + 36, width: K_ScreenWidth, height: 40))
        switchBottonView.backgroundColor = .white
        self.view.addSubview(switchBottonView)
    
      
    
        vertifyLoginButton = UIButton.init()
        vertifyLoginButton.setTitle("验证码登录", for: .normal)
        vertifyLoginButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        let buttonWidth = (vertifyLoginButton.currentTitle! as NSString).stringWithFrontReturnSize(size: CGSize(width: K_ScreenWidth, height: CGFloat(MAXFLOAT)), font: UIFont.boldSystemFont(ofSize: 24)).width
        vertifyLoginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            vertifyLoginButton.addTarget(self, action: #selector(vertifyCodeSwitch), for: .touchUpInside)
        vertifyLoginButton.frame = CGRect(x: 40, y: 0, width: buttonWidth, height: 34);
        switchBottonView.addSubview(vertifyLoginButton)
    
    
    
        passwordLoginButton = UIButton(frame: CGRect(x: vertifyLoginButton.frame.maxX + 20, y: 0, width: vertifyLoginButton.frame.size.width, height: 34))
        passwordLoginButton.setTitle("密码登录", for: .normal)
        passwordLoginButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x999999"), for: .normal)
        passwordLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        passwordLoginButton.addTarget(self, action: #selector(passwordSwitch), for: .touchUpInside)
        switchBottonView.addSubview(passwordLoginButton)
    
    
        BottomLine = UIView(frame: CGRect(x: 40, y: 37, width: buttonWidth, height: 3))
        BottomLine.backgroundColor = k_CarQIColor
        switchBottonView.addSubview(BottomLine)
    
    
    
        phoneField = UITextField(frame: CGRect(x: 40, y:switchBottonView.frame.maxY + 30, width: K_ScreenWidth - 80, height: 44))
        phoneField.placeholder = "请输入电话号码"
        phoneField.textColor = .colorWithHexStringWithoutAlpha("0x333333")
        phoneField.font = UIFont.systemFont(ofSize: 17)
        phoneField.tintColor = k_CarQIColor
        phoneField.inputAccessoryView = UIToolbar.init(frame: CGRect.zero)
        phoneField.keyboardType = .numberPad
        phoneField.clearButtonMode = .always
        self.view .addSubview(phoneField)
        
        
        phonelineVIew = UIView.init()
        phonelineVIew.frame = CGRect(x: 40, y: phoneField.frame.maxY , width: K_ScreenWidth - 80, height: 1)
        phonelineVIew.backgroundColor = k_CarQIColor
        self.view.addSubview(phonelineVIew)
        
    
    
       
       initialzieChangeButtonWithTheButton(currentButton: vertifyLoginButton)
    
    
        secondBottomLineView = UIView(frame: CGRect(x: 40, y: phonelineVIew.frame.maxY + 64, width: K_ScreenWidth - 80, height: 1))
        secondBottomLineView.backgroundColor = .colorWithHexStringWithoutAlpha("0x999999")
        self.view.addSubview(secondBottomLineView)
       
        
    

    
        loginButton = UIButton.init(frame: CGRect(x: 40, y: vertifyCodeField!.frame.maxY + 30, width: K_ScreenWidth - 80, height: 44))
        loginButton.backgroundColor = k_CarQIColor
        loginButton.setTitle("登录", for: .normal)
        loginButton.layer.cornerRadius = 22.0
        loginButton.clipsToBounds = true
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        self.view.addSubview(loginButton)
    
    }
    
    
    
    private func initialzieChangeButtonWithTheButton(currentButton button:UIButton){
        
        
        if button == vertifyLoginButton {
            //当前是验证码登录
        
            passwordField?.isHidden = true
         
            if vertifyCodeButton == nil{
                
                
                let tempCodeField = UITextField(frame: CGRect(x: 40, y: phoneField.frame.maxY + 20, width: K_ScreenWidth * 0.5, height: 44))
                tempCodeField.placeholder = "请输入验证码"
                tempCodeField.keyboardType = .numberPad
                tempCodeField.textColor = .colorWithHexStringWithoutAlpha("0x333333")
                self.view.addSubview(tempCodeField)
                self.vertifyCodeField = tempCodeField
                
                
                let getCodeButton = UIButton.init()
                getCodeButton.backgroundColor = k_CarQIColor
                getCodeButton.layer.cornerRadius = 18
                getCodeButton.clipsToBounds = true
                getCodeButton.setTitle("获取验证码", for: .normal)
                getCodeButton.setTitleColor(.white, for: .normal)
                getCodeButton.addTarget(self, action: #selector(getVertifyCode), for: .touchUpInside)
                self.view.addSubview(getCodeButton)
                getCodeButton.snp_makeConstraints({ (make ) in
                    
                    make.left.equalTo(tempCodeField.snp_right)
                    make.right.equalTo(phonelineVIew.snp_right)
                    make.centerY.equalTo(tempCodeField.snp_centerY)
                    make.height.equalTo(36)
                    
                })
                
                self.vertifyCodeButton = getCodeButton

            }else{
                
                self.vertifyCodeButton?.isHidden = false
                self.vertifyCodeField?.isHidden = false;
            }
            
        }else{
            
            //密码登录
            
            vertifyCodeButton?.isHidden = true
            vertifyCodeField?.isHidden = true
            
            if self.passwordField == nil {
                
                let passwordField = UITextField(frame: CGRect(x: 40, y: phoneField.frame.maxY + 20, width: K_ScreenWidth - 80, height: 44))
                passwordField.placeholder = "请输入登录密码"
                passwordField.textColor = .colorWithHexStringWithoutAlpha("0x333333")
                passwordField.isSecureTextEntry = true
                self.view.addSubview(passwordField)
                self.passwordField = passwordField
            }else{
                
                self.passwordField?.isHidden = false
            }
        }
        
        
        
    }
    
    
    private func switchBottomLineViewWith(currentButton button:UIButton){
        
        let buttonWidth = (button.currentTitle! as NSString).stringWithFrontReturnSize(size: CGSize(width: K_ScreenWidth, height: CGFloat(MAXFLOAT)), font: UIFont.boldSystemFont(ofSize: 24)).width
        UIView.animate(withDuration: 0.2) {
            
            var frame: CGRect = self.BottomLine.frame
            frame.size.width = buttonWidth
            self.BottomLine.frame = frame
            self.BottomLine.center = CGPoint(x: button.center.x, y: 38.5)
            
        }
        
        
        
    }
    
    
    
    /**
     *相关按钮的点击事件
     */
    
    @objc private func vertifyCodeSwitch(){
        
        passwordLoginButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x999999"), for: .normal)
        passwordLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        vertifyLoginButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        vertifyLoginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        switchBottomLineViewWith(currentButton: vertifyLoginButton)
        initialzieChangeButtonWithTheButton(currentButton: vertifyLoginButton)
        
    }
    
    /**
     密码切换
     */
    @objc private func passwordSwitch(){
        
        vertifyLoginButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x999999"), for: .normal)
        vertifyLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        passwordLoginButton.setTitleColor(.colorWithHexStringWithoutAlpha("0x333333"), for: .normal)
        passwordLoginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        switchBottomLineViewWith(currentButton: passwordLoginButton)
        initialzieChangeButtonWithTheButton(currentButton: passwordLoginButton)
        
    }
    
    
    
    @objc private func getVertifyCode(){
        
        
        
    }
    
    @objc private func loginAction() {
        
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
