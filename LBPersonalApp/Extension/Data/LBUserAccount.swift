//
//  LBUserAccount.swift
//  LBPersonalApp
//
//  Created by MR on 16/6/16.
//  Copyright © 2016年 LB. All rights reserved.
//

import UIKit

class LBUserAccount: NSObject ,NSCoding {
    // MARK:成员变量
   //Optional(["access_token": 2.00EzEyGChhDQCCd93a94b433jFqynC, "remind_in": 157679999, "uid": 1935242522, "expires_in": 157679999])
    var access_token : String?
    var expires_in : NSTimeInterval = 0 {
        didSet {
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    var expiresDate :NSDate?
    var uid :String?
    //静态常量创建一次一直在内存中, 不用每次浪费资源
    static let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/account.plist"
    private static var userAccount : LBUserAccount?
    // MARK:构造函数
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict) //KVC 字典转模型
    }
    
    // MARK:归档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
        aCoder.encodeObject(expiresDate, forKey: "expiresDate")
        aCoder.encodeObject(uid, forKey: "uid")
    }
    
    // MARK:解档
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        expiresDate = aDecoder.decodeObjectForKey("expiresDate") as? NSDate
        uid = aDecoder.decodeObjectForKey("uid") as? String
    }
    // MARK:保存账户
    func saveAccount(){
        NSKeyedArchiver.archiveRootObject(self, toFile: LBUserAccount.path)
    }
    // MARK:读取账户
    class func loadUserAccount() -> LBUserAccount?{
        if userAccount == nil {
            userAccount = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? LBUserAccount
            print("从沙盒中加载到的账户:\(userAccount)")
        }
        //判断账户是否过期
        if userAccount != nil && userAccount?.expiresDate?.compare(NSDate()) == NSComparisonResult.OrderedDescending {
            return userAccount
        }
        return nil
    }
    
    // MARK:kvc
    //字典的key在模型中找不到对应属性调用
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    // MARK:打印对象信息
    override var description: String {
        return "access_token: \(access_token), expires_in:\(expires_in), uid = \(uid), expiresDate:\(expiresDate)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
