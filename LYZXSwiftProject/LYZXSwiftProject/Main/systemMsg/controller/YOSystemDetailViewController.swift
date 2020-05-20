//
//  YOSystemDetailViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/20.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit
import WebKit

class YOSystemDetailViewController: YOBaseViewController,WKNavigationDelegate,WKUIDelegate  {

    
    var clickUrl:String?
    var messageId:String?
    var callBackBlock: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .colorWithHexStringWithoutAlpha("0xffffff")
        self.navBar.titleLabel.text = "文章详情"
        // Do any additional setup after loading the view.
        
        creatUI()
    }
    
    
    func creatUI() {
           

           let configer = WKWebViewConfiguration()
           configer.preferences = .init()
           configer.preferences.minimumFontSize = 10
           configer.preferences.javaScriptEnabled = true
           configer.preferences.javaScriptCanOpenWindowsAutomatically = false

           
           let script = WKUserScript(source: "", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
           configer.userContentController = WKUserContentController()
           configer.userContentController.addUserScript(script)
           
           let wkwebView = WKWebView(frame: CGRect(x: 0, y: YOIphoneXAdapter.returnTheNavagationBarHeight(), width: K_ScreenWidth, height: K_ScreenHeigth - YOIphoneXAdapter.returnTheNavagationBarHeight()), configuration: configer)
          
           wkwebView.uiDelegate = self
           wkwebView.navigationDelegate = self
           wkwebView.scrollView.showsVerticalScrollIndicator = false
           wkwebView.scrollView.showsHorizontalScrollIndicator = false
           wkwebView.scrollView.isScrollEnabled = true
           self.view.addSubview(wkwebView)
           
           
        guard let url = URL.init(string: self.clickUrl! ) else {
               
               print("转换错误")
               return
           }
           let request = NSURLRequest(url:url)
           wkwebView.load(request as URLRequest)
           
           
       }
       
    
    
    override func backAction() {
        
        callBackBlock?("已读")
        self.navigationController?.popViewController(animated: true)
    }
       
       /**
        *相关的代理方法
        */
       func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
           
           
           
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
