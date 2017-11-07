//
//  NetWorkTools.swift
//  XiMaLaYa-Swift
//
//  Created by apple on 2017/11/4.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import Alamofire

enum requestType : Int {
    case GET
    case POST
}
class NetWorkTools: NSObject {
//单例
    static let shareInstance : NetWorkTools = {
       let tools = NetWorkTools()
        return tools
    }()
}
//封装请求方法

extension NetWorkTools {
    func requestData(methodType : requestType, url : String, parameters: [String: Any]?, finished: @escaping (_ request: AnyObject?, _ error : NSError?)->()) -> Void {
        //定义请求结果回调包
        
        let resultCallBack = {(response: DataResponse<Any>) in
            
            if response.result.isSuccess {
                finished(response.result.value as AnyObject?, nil)
            }else {
                finished(nil, response.result.error! as NSError)
            }
        }
        
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        let httpMethod : HTTPMethod = methodType == .GET ? .get : .post
        
        request(url, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: requestHeader).responseJSON(completionHandler: resultCallBack)
        
    }
}
