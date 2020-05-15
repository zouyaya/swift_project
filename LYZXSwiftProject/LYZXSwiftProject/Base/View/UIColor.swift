//
//  UIColor.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/11.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit

//自定义颜色的类
extension UIColor{
    
    
    class func RGBcolorFrom(red:CGFloat,green:CGFloat,blue:CGFloat) -> UIColor {
        
        return UIColor.RGBcolorFrom(red: red/255.0, green: green/255.0, blue: blue/255.0)
        
    }
    
    class func colorFromRGBFloat(_ RGB: CGFloat) ->UIColor {
        
        return UIColor.RGBcolorFrom(red: RGB, green: RGB, blue: RGB)
        
    }
    
    class func colorWithHexString(_ hex: String,alpha:CGFloat) ->UIColor{
        
        
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            
            cString = (cString as NSString).substring(from: 1)
            
        }else if (cString.hasPrefix("0X") || cString.hasPrefix("0x")){
            
            cString = (cString as NSString).substring(from: 2)
            
        }
        

        if (cString as NSString).length != 6
        {
            return gray
        }
        
        let rString = (cString as NSString).substring(to:2)
        let gString = ((cString as NSString).substring(from:2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from:4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
  
        
    }
    
    
    class func colorWithHexStringWithoutAlpha(_ hex:String) ->UIColor {
    return colorWithHexString(hex, alpha:1)
    }


    
}
