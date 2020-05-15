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
    var BottomLine:UIView!
//    let passwordBottomLine:UIView!

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
