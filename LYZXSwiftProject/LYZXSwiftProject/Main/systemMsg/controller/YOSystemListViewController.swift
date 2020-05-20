//
//  YOSystemListViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/19.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import HandyJSON

class YOSystemListViewController: YOBaseViewController,UITableViewDelegate,UITableViewDataSource{

    
    private var tableView:UITableView!
    private var systemList:[BlueModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .colorWithHexStringWithoutAlpha("0xffffff")
        self.navBar.titleLabel.text = "系统消息"
        initializeViewUI()
        
        getSystemListAccordingToNewWord()
    }
    
    /**
     初始化项目页面
     */
    func initializeViewUI() {
        
        let table = UITableView(frame: CGRect(x: 0, y: YOIphoneXAdapter.returnTheNavagationBarHeight(), width: K_ScreenWidth, height: K_ScreenHeigth - YOIphoneXAdapter.returnTheNavagationBarHeight()), style: UITableView.Style.grouped)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .colorWithHexStringWithoutAlpha("0xffffff")
        table.tableFooterView = UIView.init(frame: CGRect.zero)
        self.tableView = table
        self.view.addSubview(self.tableView)
    }
    
    
    
    
    /**
     相关网络请求
     */
    
    private func getSystemListAccordingToNewWord(){
        
        YONewWorkRequestTool.requestTool.getSystemMsgListAccroding(Task: "GET_SYSTEM_MSG_LIST", curPage: "1", maxRequestNum: "10") { (responseData) in
            
            let systems = JSONDeserializer<BlueModel>.deserializeModelArrayFrom(array: responseData.array) as! [BlueModel]
            self.systemList = systems
            
            self.tableView.reloadData()
        }
        
        
    }
    
    
    
    /**
     相关的代理方法
     */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.systemList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = self.systemList?[indexPath.row]
        if model?.msgType == "text" {
            //计算文字的高度
            return computeTheTextHeight(textModel: model!)
        }
        return 260
    }
    
    //计算文字高度
    private func computeTheTextHeight(textModel model:BlueModel) -> CGFloat {
        
        var textheigth:CGFloat = 0
        let textdic:NSMutableDictionary = NSMutableDictionary()
        textdic.setValue(UIColor.colorWithHexStringWithoutAlpha("0x666666"), forKey: NSAttributedString.Key.foregroundColor.rawValue)
        textdic.setValue(UIFont.systemFont(ofSize: 16), forKey: NSAttributedString.Key.font.rawValue)
        let paraStype = NSMutableParagraphStyle.init()
        paraStype.lineSpacing = 7
        paraStype.firstLineHeadIndent = 0
        textdic.setValue(paraStype, forKey: NSAttributedString.Key.paragraphStyle.rawValue)
        textheigth = getSpacelabelHeigth(str: model.msgContent!, attr: textdic, limitWith: K_ScreenWidth - 54)
        return textheigth + 125
    }


    
    func getSpacelabelHeigth(str infoString:String,attr dict:NSMutableDictionary,limitWith width:CGFloat) -> CGFloat {
        
        
        let textSize = (infoString as NSString).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: dict as? [NSAttributedString.Key : Any], context: nil).size
        return textSize.height
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let systemModel = self.systemList?[indexPath.row]
        if systemModel?.msgType == "text" {
            
            let cell = YOSystemMsgTextTableViewCell.initCellWithTableView(with: tableView)
            cell.messageModel = self.systemList?[indexPath.row]
            return cell
            
        }else{
            
            let cell = YOSystemMsgPicTableViewCell.initCellWithTableView(with: tableView)
            cell.systemModel = systemModel
            return cell
            
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var systemModel = self.systemList?[indexPath.row]
        if systemModel?.msgType != "text" {
            
            let detailVC = YOSystemDetailViewController()
            detailVC.clickUrl = systemModel?.clickUrl!
            detailVC.messageId = systemModel?.id!
            detailVC.callBackBlock = { message in
                
                systemModel?.readFlag! = "1"
                self.tableView.reloadRows(at: [indexPath], with: .none)
                
            }
            self.navigationController?.pushViewController(detailVC, animated: true)
            
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
