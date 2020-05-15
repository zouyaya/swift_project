//
//  YOPatientListViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOPatientListViewController: YOBaseViewController {

    override func viewWillAppear(_ animated: Bool) {
           
        super.viewWillAppear(animated)
        self.navBar.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
