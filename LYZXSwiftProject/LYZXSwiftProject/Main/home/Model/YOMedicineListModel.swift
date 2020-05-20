//
//  YOMedicineListModel.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/16.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import HandyJSON

struct YOMedicineListModel:HandyJSON {
    
    var drugstock_name = ""
    var drugstore_id = ""
    var sort = ""
    var common_name = ""
    var product_name = ""
    var efficacy = ""
   var soldstatus = ""
   var drug_price = ""
   var drugstore_name = ""
   var specification = ""
   var drug_url = ""
   var hot_level = ""
   var doctor_common_drug_id = ""
   var companyName = ""
   var stock_num = ""
   var advertisize_flag = ""
   var drugstock_id = ""
   var has_useage = ""
   var drug_price_old = ""
   var drug_price_info = ""


}


struct HomeBannerModel:HandyJSON {
    
    var clickUrl: String?
    var homeTopBannerUrl: String?
    
}


struct HomeChatItemModel:HandyJSON {
    
    var sendTime: String?
    var msgContent: String?
    var patientIconUrl: String?
    var msgType: String?
    var sendTimeMill:String?
    var patientId :String?
    var expireTime: String?
    var patientName:String?
    var unReadCount:Int?
    
}


struct BlueModel:HandyJSON {
   
    var title: String?
    var readFlag: String?
    var id: String?
    var clickType :String?
    var appEvent: String?
    var clickUrl: String?
    var icon: String?
    var msgType: String?
    var msgContent: String?
    var time: String?
    var noReadNum: String?
  
}
