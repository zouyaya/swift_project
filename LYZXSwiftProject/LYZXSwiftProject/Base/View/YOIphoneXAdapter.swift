//
//  YOIphoneXAdapter.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/11.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

class YOIphoneXAdapter: NSObject {
    
    class func returnTheNavagationBarHeight() ->CGFloat{
        
        if #available(iOS 11.0, *) {
           
            if (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets.bottom == 0 {
                
                //iphone 系列
                return 64;
                
            }else{
                
                return 88
            }
            
            
        }else{
            
            return 64
            
        }
        
        
    }
    
    
    
    class func getTheStatusBarHeight() ->CGFloat{
        
        if #available(iOS 11.0, *) {
          
           if (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets.bottom == 0 {
               
               //iphone 系列
               return 20;
               
           }else{
               
               return 44
           }
           
           
       }else{
           
           return 20
           
       }
        
        
    }
    
  
}
