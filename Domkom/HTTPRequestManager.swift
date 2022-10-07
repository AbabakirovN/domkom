//
//  HTTPRequestManager.swift
//  Poputka
//
//  Created by Sanira Madzhikova on 4/3/18.
//  Copyright © 2018 Neobis. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration

class HTTPRequestManager {
    
    typealias SuccessHandler = (Data?) -> Void
    typealias FailureHandler = (String)-> Void
    typealias Parameter = [String: Any]?
    
    private func request(method: HTTPMethod, url: String, parameters: Parameter, header: HTTPHeaders?,completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        if !isConnectedToNetwork() {
            error(Constants.Network.ErrorMessage.NO_INTERNET_CONNECTION)
            return
        }
        
        let apiUrl = url
        
        Alamofire.request(apiUrl, method: method, parameters: parameters, encoding: JSONEncoding.default , headers: header).responseData { (response) in
            
            guard response.response != nil else {
                error(Constants.Network.ErrorMessage.UNABLE_LOAD_DATA)
                return
            }
            
            guard let statusCode = response.response?.statusCode else {
                error(Constants.Network.ErrorMessage.NO_HTTP_STATUS_CODE)
                return
            }
            switch(statusCode) {
            case HTTPStatusCode.unauthorized.statusCode:
                error(Constants.Network.ErrorMessage.UNAUTHORIZED)
                break
                
            case HTTPStatusCode.notFound.statusCode:
                error(Constants.Network.ErrorMessage.NOT_FOUND)
                break
                
            case HTTPStatusCode.forbidden.statusCode:
                error(Constants.Network.ErrorMessage.FORBIDDEN)
                break
                
            case HTTPStatusCode.internalServerError.statusCode,
                 HTTPStatusCode.serviceError.statusCode,
                 HTTPStatusCode.serviceUnavailable.statusCode,
                 HTTPStatusCode.serviceDowntime.statusCode:
                error(Constants.Network.ErrorMessage.SERVER_ERROR)
                break
                
            case HTTPStatusCode.badRequest.statusCode:
                error(Constants.Network.ErrorMessage.BAD_REQUEST)
                break
                
            case HTTPStatusCode.ok.statusCode,
                 HTTPStatusCode.accepted.statusCode,
                 HTTPStatusCode.done.statusCode,
                 HTTPStatusCode.created.statusCode:
                
                completion(response.data)
                break
            default:
                error("")
            }
        }
    }
    
    
    internal func post(url: String, parameters: Parameter, header: HTTPHeaders?, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .post, url: url, parameters: parameters, header: header, completion: completion, error: error)
    }
    internal func get(url: String, header: HTTPHeaders, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .get, url: url, parameters: nil, header: header, completion: completion, error: error)
    }
    
    internal func put(url: String, parameters: Parameter, header: HTTPHeaders, completion: @escaping SuccessHandler, error: @escaping FailureHandler) {
        request(method: .put, url: url, parameters: parameters, header: header, completion: completion, error: error)
    }
    
    
    // MARK: - Internet Connectivity
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    func getRequestHeader() -> HTTPHeaders {
        return [:]
    }
    
}
