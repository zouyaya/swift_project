//
//  extentString.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/15.
//  Copyright © 2020 hello. All rights reserved.
//

import Foundation
import CommonCrypto

extension String{
    
    var MD5:String{
        
        let cStr = self.cString(using: .utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString()
        for i in 0..<16 {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
        }
        
    }
    
    

