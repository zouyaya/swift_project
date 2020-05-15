//
//  YONetworkReachability.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class YONetworkReachability: NSObject {
    
    static let reachAbility = YONetworkReachability()
    var reachable:Bool{
        
        var reach = true
        let manager = NetworkReachabilityManager(host: "https://www.baidu.com")
        manager?.listener = {status in
            
            switch status {
            case .notReachable:
                
                reach = false
                SVProgressHUD.showError(withStatus: "网络出错")
                
            case .reachable(.ethernetOrWiFi):
                
                reach = true
                
            case .reachable(.wwan):
                
                reach = true
                
            case .unknown:
                
                reach = false
                SVProgressHUD.showError(withStatus: "网络出错")
            }

        }
        manager?.startListening()
        return reach
    }

}
