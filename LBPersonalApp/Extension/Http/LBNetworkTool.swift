//
//  LBNetworkTool.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/15.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit
import AFNetworking
class LBNetworkTool: AFHTTPSessionManager {
    //单例
    static let sharedInstance : LBNetworkTool = {
        let baseUrl = NSURL(string: "https://api.weibo.com/")
        let tool  =  LBNetworkTool(baseURL: baseUrl)
        // 添加响应的序列化器
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    // MARK: 常量
    private let client_ID =  "1865645825"
    let redirect_URI = "http://www.baidu.com"
    private let client_secret = "3330fc6f1546f02879208dee1d21bb2f"
    // MARK: 返回授权界面的url
    func oauthURL() ->NSURL{
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_ID)&redirect_uri=\(redirect_URI)"
        return NSURL(string: urlString)! // ! 表示一定能够生成
    }
    
    // MARK:加载accessToken
    func loadAccessToken(code: String, finished:(result: [String: AnyObject]?,error: NSError?) -> ()){
        let urlString = "oauth2/access_token"
        let param = [
            "client_id": client_ID,
            "client_secret":client_secret,
            "grant_type":"authorization_code",
            "code":code,
            "redirect_uri":redirect_URI
        ]
        POST(urlString, parameters: param, progress: nil, success: { (_, result) -> Void in
            finished(result: result as? [String : AnyObject], error: nil)
            }) { (_, error) -> Void in
            finished(result: nil, error: error)
        } // as? 表示可选 如果没有就返回nil ,  as!如果没有则崩溃

    }
    // MARK:加载用户信息
    func loadUserInfo(finished: ([String : AnyObject]? ,error : NSError?)->()){
        
    }
}
