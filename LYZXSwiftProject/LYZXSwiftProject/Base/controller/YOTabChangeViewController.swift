//
//  YOTabChangeViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOTabChangeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        addChildController(controller: YOHomeViewController(), title: "首页", defaultImage: UIImage(named:"ms_tabbar_home_normal")!, selectedImage: UIImage(named:"ms_tabbar_home_selected")!)
        
        addChildController(controller: YOPatientListViewController(), title: "患者", defaultImage: UIImage(named:"ms_tabbar_patient_normal")!, selectedImage: UIImage(named:"ms_tabbar_patient_selected")!)
        
        addChildController(controller: YOMneViewController(), title: "我的", defaultImage: UIImage(named:"ms_tabbar_mine_normal")!, selectedImage: UIImage(named:"ms_tabbar_mine_selected")!)
    
        
    
    }
    
    
    
    func addChildController(controller childVC: UIViewController,title childTitle: String,defaultImage norImage:UIImage,selectedImage seleIamge:UIImage) {
        
        self.tabBar.backgroundColor = .colorWithHexStringWithoutAlpha("0xffffff")
        self.tabBar.backgroundImage = .imageWithColor(rgb: .white)
        self.tabBar.tintColor = k_CarQIColor
        
        childVC.title = childTitle
    childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.colorWithHexStringWithoutAlpha("0x666666")] ,for: .normal)
   childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:k_CarQIColor], for: .selected)
     
        childVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        childVC.tabBarItem.image = norImage.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = seleIamge.withRenderingMode(.alwaysOriginal)
        

        let nav = UINavigationController(rootViewController: childVC)
        self.addChild(nav)
        
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
