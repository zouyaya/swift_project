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
    
    
    public func md5(strs:String) ->String!{
         let str = strs.cString(using: String.Encoding.utf8)
         let strLen = CUnsignedInt(strs.lengthOfBytes(using: String.Encoding.utf8))
         let digestLen = Int(CC_MD5_DIGEST_LENGTH)
         let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
         CC_MD5(str!, strLen, result)
         let hash = NSMutableString()
         for i in 0 ..< digestLen {
             hash.appendFormat("%02x", result[i])
         }

         return String(format: hash as String)
       }
    
    
    
}
