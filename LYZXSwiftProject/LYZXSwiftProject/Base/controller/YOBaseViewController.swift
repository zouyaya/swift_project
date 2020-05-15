//
//  YOBaseViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/11.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOBaseViewController: UIViewController {

    
    var navBar :YONavBarView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

        creatNavBarUI()
    
    }
    


    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .default
    }
    
    
    func creatNavBarUI() {
        
        
        navBar = YONavBarView(frame: CGRect(x: 0, y: 0, width: K_ScreenWidth, height: YOIphoneXAdapter.returnTheNavagationBarHeight()))
        navBar.backgroundColor = .colorWithHexStringWithoutAlpha("0xffffff")
        self.view.addSubview(navBar)
        
    
        navBar.backButton .addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
    }


    @objc func backAction(){
        
       self.navigationController?.popViewController(animated: true)
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
