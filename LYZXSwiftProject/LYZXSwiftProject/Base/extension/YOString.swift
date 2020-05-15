//
//  YOString.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/13.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit


extension NSString{
    
    
    func stringWithFrontReturnSize(size maxSize:CGSize,font Font:UIFont) -> CGSize {
          
        let attrs = [NSAttributedString.Key.font:Font]
        return boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: attrs, context: nil).size
          
      }
    
    
}


