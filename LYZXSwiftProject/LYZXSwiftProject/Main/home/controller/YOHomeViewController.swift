//
//  YOHomeViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOHomeViewController: YOBaseViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navBar.removeFromSuperview()        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        creatUI()
        
    }
    

    func creatUI() {
        
        let tempButton = UIButton(frame: CGRect(x: 100, y: 50, width: 100, height: 50))
        tempButton.backgroundColor = .colorWithHexStringWithoutAlpha("0xff4444")
        tempButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(tempButton)
        
        
        
    }
    
    
    
    @objc fileprivate func click(){
        
//        let sumbvc = YOLoginChooseViewController()
//        self.navigationController?.pushViewController(sumbvc, animated: true)
        
        requestmedicineList()

        
    }
    
    
    
    //doctor=24
    
    func requestmedicineList(){
        
        YONewWorkRequestTool.requestTool.getDoctorInfo(Task: "DOCTOR_INFO") { (result) in
        
            print("请求结果 \(result)")
        
   
        }
     
        
        
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
