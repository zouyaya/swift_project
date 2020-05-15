//
//  YOMneViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOMneViewController: YOBaseViewController,UITableViewDataSource,UITableViewDelegate {

    
    var tableView:UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
           
        super.viewWillAppear(animated)
        self.navBar.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        creatMainUI()
        
        
    }
    
    
    /**
     *相关页面的初始化
     */
    func creatMainUI() {
        
        tableView = UITableView.init(frame: CGRect(x: 0, y: -YOIphoneXAdapter.getTheStatusBarHeight() , width: K_ScreenWidth, height: K_ScreenHeigth - 44 + YOIphoneXAdapter.getTheStatusBarHeight()), style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView(frame: CGRect.zero)
        tableView?.backgroundColor = UIColor.colorWithHexStringWithoutAlpha("0xff4444")
        self.view.addSubview(tableView!)

    }
    
    
    
    
    
    /**
     *相关的代理方法
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1{
            
            return 5
        }
        
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1 {
            
            return 10;
            
        }
        
        return 0.001;
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        if section == 1{
            
            let headerView = UIView(frame:CGRect(x: 0, y: 0, width: K_ScreenWidth, height: 10))
            headerView.backgroundColor = UIColor.colorWithHexStringWithoutAlpha("0xf2f2f2")
            return headerView
            
        }else{
            
            return nil
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.0001
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            
            return 200;
        }
        
        return 56;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0{
            
            
        }else{
            
            
            
        }
        
        return UITableViewCell()
        
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
