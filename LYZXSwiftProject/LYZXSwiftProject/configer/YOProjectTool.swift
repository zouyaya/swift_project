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
        
        let token = UserDefaults.standard.object(forKey: "access_token") as? String
        if nil == token {
            
            return ""
        }else{
            return token!
        }
        
    }
    
    
    
    class func getDoctorId() ->String{
        
        let doctorId = UserDefaults.standard.object(forKey: "doctorId") as? String
        if nil == doctorId {
            
            return ""
        }else{
            
            return doctorId!
        }
        
    }
    
    
    class func getTheCurrentPhone() ->String{
        
        
        var systemInfo = utsname()
               uname(&systemInfo)
               
               let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
                       return String(cString: ptr)
                   }
               
               if platform == "iPhone1,1" { return "iPhone 2G"}
               if platform == "iPhone1,2" { return "iPhone 3G"}
               if platform == "iPhone2,1" { return "iPhone 3GS"}
               if platform == "iPhone3,1" { return "iPhone 4"}
               if platform == "iPhone3,2" { return "iPhone 4"}
               if platform == "iPhone3,3" { return "iPhone 4"}
               if platform == "iPhone4,1" { return "iPhone 4S"}
               if platform == "iPhone5,1" { return "iPhone 5"}
               if platform == "iPhone5,2" { return "iPhone 5"}
               if platform == "iPhone5,3" { return "iPhone 5C"}
               if platform == "iPhone5,4" { return "iPhone 5C"}
               if platform == "iPhone6,1" { return "iPhone 5S"}
               if platform == "iPhone6,2" { return "iPhone 5S"}
               if platform == "iPhone7,1" { return "iPhone 6 Plus"}
               if platform == "iPhone7,2" { return "iPhone 6"}
               if platform == "iPhone8,1" { return "iPhone 6S"}
               if platform == "iPhone8,2" { return "iPhone 6S Plus"}
               if platform == "iPhone8,4" { return "iPhone SE"}
               if platform == "iPhone9,1" { return "iPhone 7"}
               if platform == "iPhone9,2" { return "iPhone 7 Plus"}
               if platform == "iPhone10,1" { return "iPhone 8"}
               if platform == "iPhone10,2" { return "iPhone 8 Plus"}
               if platform == "iPhone10,3" { return "iPhone X"}
               if platform == "iPhone10,4" { return "iPhone 8"}
               if platform == "iPhone10,5" { return "iPhone 8 Plus"}
               if platform == "iPhone10,6" { return "iPhone X"}
               if platform == "iPhone11,8" { return "iPhone XR"}
               if platform == "iPhone11,2" { return "iPhone XS"}
               if platform == "iPhone11,6" { return "iPhone XS Max"}
               if platform == "iPhone11,4" { return "iPhone XS Max"}
               if platform == "iPhone12,1" { return "iPhone 11"}
               if platform == "iPhone12,3" { return "iPhone 11 Pro"}
               if platform == "iPhone12,5" { return "iPhone 11 Pro Max"}
               if platform == "i386" { return "iPhone Simulator"}
               if platform == "x86_64" { return "iPhone Simulator"}
    
        return platform
        
    }
    

}
