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
    
    var pararams : [String:String] = ["doctorId":"\(YOProjectTool.getDoctorId())",
        "doctorid":"\(YOProjectTool.getDoctorId())"
        ,"access_token":"\(YOProjectTool.getToken())","version_code":"4.1.0","platform":"IOS","app_name":"YSZS-IOS","IP":"192.168.0.1"]
     
    func handleResponse(JSON json:JSON) -> result{
        
        return result(succ: true, ret: json["ret"].int, msg: json["msg"].string, data: json["data"].dictionaryObject)
    }
    
    
    
    
    
    /**
     获取项目的Token
    
     */
    
    
    func getLoalToken() -> String {
        
        let tokenString = UserDefaults.standard.object(forKey: "access_token") as! String
        return tokenString;
        
    }
    
    
    func getPeojectTokenWith(Task task:String,Handler comp: @escaping((result)->Void)){
        
        pararams["task"] = task
        YONetWork.requestWith(Method: .get, URL: baseUrl + AppCommon, Paramas: pararams, Token: nil) { (response) in
            
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
    
    /**
     登录接口
     */
    func loginUserWithParasmas(Task task: String,tel phone:String,pswd password:String,type logintype:String,Handler comp: @escaping((result)->Void)) {
        
        pararams["task"] = task
        pararams["account"] = phone
        pararams["loginType"] = logintype
        if logintype == "0"{
            pararams["password"] = password.MD5
        }else{
            
              pararams["password"] = password
        }
        
        pararams["deviceUUID"] = UUID().uuidString
        pararams["phoneModel"] = YOProjectTool.getTheCurrentPhone()
        YONetWork.requestWith(Method: .post, URL: baseUrl + AppDoctor , Paramas: pararams, Token: nil) { (response) in

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
