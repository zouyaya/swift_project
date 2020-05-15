//
//  YOProjectTool.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOProjectTool: NSObject {
    
    class func IsBlankString(str string:String?) ->String{
        
        if string == nil {
            
            return ""
        }
        return string!

    }
    
    
    
    class func getToken()-> String{
        
        let token = UserDefaults.standard.object(forKey: "access_token") as! String
        if token.count == 0 {
            return ""
        }else{
            
            return token;
        }
        
        
    }
    

}
