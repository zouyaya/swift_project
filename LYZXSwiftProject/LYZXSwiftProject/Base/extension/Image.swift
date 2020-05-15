//
//  Image.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    class func imageWithColor(rgb color: UIColor) ->UIImage{
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let contextRef:CGContext = UIGraphicsGetCurrentContext()!
         
        contextRef.setFillColor(color.cgColor)
        contextRef.fill(rect)
        
        let image :UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
        
    }

    
}

