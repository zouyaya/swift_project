//
//  YONetWork.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class YONetWork: NSObject {

    struct reponseData {
        
        var request: URLRequest?
        var response:HTTPURLResponse?
        var json:AnyObject?
        var error:NSError?
        var res_data:Data?

    }
    
    class func requestWith(Method method: Alamofire.HTTPMethod, URL url: String,Paramas paramas: [String:Any]?,Token token:String?, hander: @escaping(reponseData) ->Void){
        
        let reachAble = YONetworkReachability.reachAbility.reachable
        if reachAble {
            
            var dicToken:[String:String]!
            if token != nil{
                dicToken = ["tokenId" : token!]
            }
            
            let manager = Alamofire.SessionManager.default
            manager.session.configuration.timeoutIntervalForRequest = 10
            manager.request(url, method: method, parameters: paramas, encoding: URLEncoding.default, headers: dicToken).response { (respose) in
                
                let json:AnyObject! = try? JSONSerialization.jsonObject(with: respose.data!, options: .allowFragments) as AnyObject
                
                if nil != json {
                    
    
                    let res = reponseData(request:respose.request, response:respose.response, json:json, error:respose.error as NSError?, res_data:respose.data)
                    
                    hander(res)
                }
                
                
            }

            
        }

    }
    
    
    
}
