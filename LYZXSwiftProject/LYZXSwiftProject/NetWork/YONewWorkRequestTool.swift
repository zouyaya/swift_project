//
//  YONewWorkRequestTool.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD


class YONewWorkRequestTool: NSObject {

    
    static let requestTool = YONewWorkRequestTool()
    
    let baseUrl = "http://admin.liangyizaixian.com/api/"

    struct result {
        
        var succ: Bool = false
        var ret :Int?
        var msg :String?
        var data :[String:Any]?

    }
    
    /**
     *公共参数的封装
     */
     var pararams : [String:String] = ["doctorId":"274",
                                       "doctorid":"274"
        ,"access_token":"635a4392415440179e6d11d35556c74e35da9001a6784cbd8d14e474c72632e4","version_code":"4.1.0","platform":"IOS","app_name":"YSZS-IOS","IP":"192.168.0.1"]
     
    func handleResponse(JSON json:JSON) -> result{
        

        return result(succ: true, ret: json["ret"].int, msg: json["msg"].string, data: json["data"].dictionaryObject)
    }
    
    

    /**
     获取医生信息
     */
    func getDoctorInfo(Task task:String,Handler comp: @escaping((result)->Void)) {
        pararams["task"] = task
        YONetWork.requestWith(Method: .get, URL: baseUrl + AppDoctor, Paramas: pararams, Token: nil) { (response) in
            
            do{
                let json = try JSON(data: response.res_data!)
               if JSON.null != json{
                  
                  let aResult = self.handleResponse(JSON: json)
                  comp(aResult)
              }
                
            }catch{}
           
        }
        
    }
    
    
    
    /**
     获取医生组手服务协议
     */
    
    func getServicePortocolUrl(Task task:String,Handler comp: @escaping((result)->Void)){
        
        pararams["task"] = task
        pararams["type"] = "0"
        YONetWork.requestWith(Method: .get, URL: baseUrl + AppCommon , Paramas: pararams, Token: nil) { (response) in
               do{
                   let json = try JSON(data: response.res_data!)
                  if JSON.null != json{
                     
                     let aResult = self.handleResponse(JSON: json)
                     comp(aResult)
                 }
                   
               }catch{}
            
        }
 
        
    }
    
    
}
