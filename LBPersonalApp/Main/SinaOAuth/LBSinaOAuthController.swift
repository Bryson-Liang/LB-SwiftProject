//
//  LBSinaOAuthController.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/15.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit
import SVProgressHUD
class LBSinaOAuthController: UIViewController{

    // MARK:父类方法
    override func loadView() {
        webView.delegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "what are you 弄啥勒"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: UIBarButtonItemStyle.Plain, target: self, action: "autoFill")
        
        webView.loadRequest(NSURLRequest(URL: LBNetworkTool.sharedInstance.oauthURL()))
    }

    // MARK:关闭页面
    func close(){
        SVProgressHUD.dismiss()
        dismissViewControllerAnimated(true, completion: nil)
    }
    // MARK:填充密码
    func autoFill(){
        // 创建js代码
        let js = "document.getElementById('userId').value='13009374527'; document.getElementById('passwd').value='lb8522707';"
        // 让webView执行js代码
        webView.stringByEvaluatingJavaScriptFromString(js)
    }
    // MARK: 加载accessToken
    func loadAccessToken(code: String){
        LBNetworkTool.sharedInstance.loadAccessToken(code) { (result, error) -> () in
            if error != nil || result == nil {
                SVProgressHUD.showWithStatus("你的网络不给力")
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1), dispatch_get_main_queue(), { () -> Void in
                    self.close() //闭包要用self
                })
                return
            }
           let userAccount = LBUserAccount(dict: result!)
           userAccount.saveAccount()
            SVProgressHUD.dismiss()
        }
    }
    // MARK:懒加载
    private lazy var webView = UIWebView()
}
 // MARK:扩展webview 协议
extension LBSinaOAuthController : UIWebViewDelegate{
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let urlString =  request.URL!.absoluteString
        // 如果不是回调的url 继续加载
        if !urlString.hasPrefix(LBNetworkTool.sharedInstance.redirect_URI){
            return true
        }
        //可选绑定
        if let query = request.URL!.query {// query 是url中参数字符串
            let codeStr = "code="
            if query.hasPrefix(codeStr){ //授权
                let nsQuery = query as NSString
                let code = nsQuery.substringFromIndex(codeStr.characters.count)
                loadAccessToken(code)
            }else{ //取消授权
                close()
            }
        }
        return false
    }
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.showWithStatus("正在加载...")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    /*
    授权成功 : code=e33906d3d2943f7ee4397e93788ffc5b
    授权失败 : URL: https://m.baidu.com/?error_uri=%2Foauth2%2Fauthorize&error=access_denied&error_description=user%20denied%20your%20request.&error_code=21330&from=844b&vit=fps
    */
}