//
//  YOHomeViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/12.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import HandyJSON

class YOHomeViewController: YOBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,YOHomeOPerationCollectionViewCellDelegate{

    
    private var bannerArray:[HomeBannerModel]?
    private var chatItemsList:[HomeChatItemModel]?
    private var systemModel:BlueModel?
    
    //注册不同的cell
    private let HomebannerCellRegisterID = "YOBannerCollectionViewCell"
    private let HomeOperationCellID = "YOHomeOPerationCollectionViewCell"
    private let HomeChatItemCellID = "YOHomeChatItemCollectionViewCell"
    private let HomeSystemItemCellID = "YOHomeSystemCollectionViewCell"
    private let HomeSectionHeaderId  = "HomeSectionHeaderId"
    
    var collectionView:UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navBar.removeFromSuperview()        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialzieViewUI()
        getHomeBanner()
        getLastSystemMsg()
        getChatItemList()
        
    }
    func initialzieViewUI() {
        
        let flaout = UICollectionViewFlowLayout.init()
        flaout.scrollDirection = .vertical
        flaout.minimumLineSpacing = 0;
        
        let collection = UICollectionView.init(frame: CGRect(x: 0, y: -YOIphoneXAdapter.getTheStatusBarHeight() - 10, width: K_ScreenWidth, height: K_ScreenHeigth - 44 + YOIphoneXAdapter.getTheStatusBarHeight() + 10), collectionViewLayout: flaout)
        collection.delegate = self;
        collection.dataSource = self
        collection.bounces = false
        collection.isPagingEnabled = true
        collection.backgroundColor = .colorWithHexStringWithoutAlpha("0xffffff")
        //注册相关的cell
        collection.register(YOBannerCollectionViewCell.self, forCellWithReuseIdentifier: HomebannerCellRegisterID)
        
        collection.register(YOHomeOPerationCollectionViewCell.self, forCellWithReuseIdentifier: HomeOperationCellID)
        
        collection.register(YOHomeChatItemCollectionViewCell.self, forCellWithReuseIdentifier: HomeChatItemCellID)
        
        collection.register(YOHomeSystemCollectionViewCell.self, forCellWithReuseIdentifier: HomeSystemItemCellID)
        
        collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeSectionHeaderId)
        
        self.collectionView = collection
        self.view.addSubview(self.collectionView)

    }
 

/**
     
*网络请求
*/
    
    
        /**
         获取banner的请求
         */
        func getHomeBanner(){
            
            YONewWorkRequestTool.requestTool.getHomeBanner(Task: "HOME_TOP_BANNERS") { (responseData) in
                
                let bannerList = JSONDeserializer<HomeBannerModel>.deserializeModelArrayFrom(array: responseData.array)
                self.bannerArray = bannerList as? [HomeBannerModel]
                self.collectionView.reloadData()
                
            }

        }
    
    
    func getLastSystemMsg()  {
        
        YONewWorkRequestTool.requestTool.getHomeSystemMessage(Task: "GET_LAST_SYSTEM_MSG"){ (responseData) in
           
            let dic = responseData.data
            let infoDic:[String:Any]? = dic!["msg"] as? [String:Any]
            let noReadCount:Int? = dic!["noReadNum"] as? Int
            let model = JSONDeserializer<BlueModel>.deserializeFrom(dict: infoDic)
            self.systemModel = model
            self.systemModel?.noReadNum = String(noReadCount!)
            self.collectionView.reloadData()
        }

    }
    
    
    func getChatItemList()  {
        
        YONewWorkRequestTool.requestTool.getHomeChatList(Task: "DOCTOR_PATIENT_MAIN_CHAT_LIST", hourFormat: "12") { (responseData) in
            
            let chatList = JSONDeserializer<HomeChatItemModel>.deserializeModelArrayFrom(array: responseData.array) as! [HomeChatItemModel]
            self.chatItemsList = chatList
            self.collectionView.reloadData()
        }
        
    }

    

/**
     *相关的代理方法
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 4
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if section == 3 {
            
            return self.chatItemsList?.count ?? 0
        }
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        
        if section == 3 || section == 1 {
            
           return CGSize.zero
        }
        return CGSize(width: K_ScreenWidth, height: 10)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            let headerView :UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeSectionHeaderId, for: indexPath)
            headerView.backgroundColor = .colorWithHexStringWithoutAlpha("0xf2f2f2")
            return headerView
        }
       
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            
            return CGSize(width: K_ScreenWidth, height: 170)
            
        }else if indexPath.section == 0{
            
            return CGSize(width: K_ScreenWidth, height: 180)
            
        }else{
            
             return CGSize(width: K_ScreenWidth, height: 70)
            
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            
            let cell:YOBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomebannerCellRegisterID, for: indexPath) as! YOBannerCollectionViewCell
            cell.bannerModel = self.bannerArray?[indexPath.row]

            return cell
            
        }else if indexPath.section == 1{
            
            let cell:YOHomeOPerationCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeOperationCellID, for: indexPath) as! YOHomeOPerationCollectionViewCell
            cell.delegate = self
            return cell
            

        }else if indexPath.section == 3{
            
            let cell :YOHomeChatItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeChatItemCellID, for: indexPath) as! YOHomeChatItemCollectionViewCell
            cell.itemModel = self.chatItemsList?[indexPath.row]
            return cell

        }else{
            
            let cell :YOHomeSystemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSystemItemCellID, for: indexPath) as! YOHomeSystemCollectionViewCell
            cell.systemModel = self.systemModel
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //相关的点击事件
        if indexPath.section == 0 {
           
            let webUrl = YOServiceProtocolViewController()
            webUrl.clickUrl = self.bannerArray?[indexPath.row].clickUrl!
            webUrl.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(webUrl, animated: true)
            
        }else if indexPath.section == 2{
            //系统消息
            let systemVC = YOSystemListViewController()
            systemVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(systemVC, animated: true)

        }


    }
    
    
    /**
     相关按钮的点击事件
     YOHomeOPerationCollectionViewCellDelegate
     */
    
    func cellButtonClickWithTheButtonIndex(operateType: HomeOPerationType) {
        
        switch operateType {
        case .askPatient: //邀请患者
            
            let askPatientVC = YOAskPatientViewController()
            askPatientVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(askPatientVC, animated: true)
            break
            
        case .payConsult:
            
            let assistVC = YODoctorAssistViewController()
            assistVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(assistVC, animated: true)
            
            break
        case .medicalCeter:
            
            let medicalVC = YOMedicalCenterViewController()
            medicalVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(medicalVC, animated: true)
            break
        case .appointDiagnose:
            
            let appointVC = YOSchemeduleViewController()
            appointVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(appointVC, animated: true)
            break
        case .myDroom:
            
            let mydrugRoom = YOMyDrugRoomViewController()
            mydrugRoom.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(mydrugRoom, animated: true)
            break
        case .HuanjiaoCenter:
            
            let huanjiaoVC = YOHuanJiaoMainViewController()
            huanjiaoVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(huanjiaoVC, animated: true)
            break
        }
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
