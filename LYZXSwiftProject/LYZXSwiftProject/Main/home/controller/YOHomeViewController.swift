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
    
    //注册不同的cell
    private let HomebannerCellRegisterID = "YOBannerCollectionViewCell"
    private let HomeOperationCellID = "YOHomeOPerationCollectionViewCell"
    
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
        
        collection.register(YOBannerCollectionViewCell.self, forCellWithReuseIdentifier: HomebannerCellRegisterID)
        
        collection.register(YOHomeOPerationCollectionViewCell.self, forCellWithReuseIdentifier: HomeOperationCellID)
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

    

/**
     *相关的代理方法
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: K_ScreenWidth, height: 10)
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//
//
//
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            
            return CGSize(width: K_ScreenWidth, height: 200)
            
        }else{
            
            return CGSize(width: K_ScreenWidth, height: 180)
        }
      
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            
            let cell:YOBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomebannerCellRegisterID, for: indexPath) as! YOBannerCollectionViewCell
            cell.bannerModel = self.bannerArray?[indexPath.row]

            return cell
            
        }else{
            
            let cell:YOHomeOPerationCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeOperationCellID, for: indexPath) as! YOHomeOPerationCollectionViewCell
            cell.delegate = self
            return cell
            

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //相关的点击事件
        
        let webUrl = YOServiceProtocolViewController()
        webUrl.clickUrl = self.bannerArray?[indexPath.row].clickUrl!
        self.navigationController?.pushViewController(webUrl, animated: true)
        

    }
    
    
    /**
     相关按钮的点击事件
     
     */
    
    func cellButtonClickWithTheButtonIndex(operateType: HomeOPerationType) {
        
        switch operateType {
        case .askPatient: //邀请患者
            
            let askPatientVC = YOAskPatientViewController()
            self.navigationController?.pushViewController(askPatientVC, animated: true)
            break
            
        case .payConsult:
            
            let assistVC = YODoctorAssistViewController()
            self.navigationController?.pushViewController(assistVC, animated: true)
            
            break
        case .medicalCeter:
            
            let medicalVC = YOMedicalCenterViewController()
            self.navigationController?.pushViewController(medicalVC, animated: true)
            break
        case .appointDiagnose:
            
            let appointVC = YOSchemeduleViewController()
            self.navigationController?.pushViewController(appointVC, animated: true)
            break
        case .myDroom:
            
            let mydrugRoom = YOMyDrugRoomViewController()
            self.navigationController?.pushViewController(mydrugRoom, animated: true)
            break
        case .HuanjiaoCenter:
            
            let huanjiaoVC = YOHuanJiaoMainViewController()
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
