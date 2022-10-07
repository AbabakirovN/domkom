//
//  ServerManager.swift
//  Poputka
//
//  Created by Sanira Madzhikova on 4/3/18.
//  Copyright © 2018 Neobis. All rights reserved.
//

import UIKit
import Alamofire

class ServerManager: HTTPRequestManager  {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
}

extension ServerManager {
    
    func getProfileInfo(token: String, _ completion: @escaping ([Profile]) -> Void, _ error: @escaping (String) -> Void){
        let header: [String: String] = [
            "Authorization": "token \(token)",
            "Content-Type": "application/json"
        ]
       self.get(url: "http://142.93.160.186/reg/users/", header: header, completion: {
            (data) in
            do {
                guard let data = data else {return}
                let profileInfo = try JSONDecoder().decode([Profile].self, from: data)
                DispatchQueue.main.async {
                    completion(profileInfo)
                }
            } catch let err {
                       error(err.localizedDescription)
                   }
               }, error: error)
    }
    
    func postPhone(phone: String, _ completion: @escaping (User)-> Void, _ error: @escaping (String)-> Void) {
        let parameters: [String: Any] = [
            "phone": phone,
        ]
        let header = ["Content-Type": "application/json"]
        self.post(url: "http://142.93.160.186/auth/send/", parameters: parameters, header: header, completion: { (data) in
            do {
                guard let data = data else {return}
                let user = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    completion(user)
                }
            } catch let err {
                error(err.localizedDescription)
            }
        }, error: error)
    }
    
    func postUserInfo(token: String, userInfo: UserInfo, _ completion: @escaping (String)-> Void, _ error: @escaping (String)-> Void) {
        let dicArray = userInfo.automobile.map {
            $0.dictionaryRepresentation
        }
        let parameters: [String: Any] = [
            "full_name": userInfo.full_name,
            "address": userInfo.address,
            "flat": userInfo.flat,
            "floor": userInfo.floor,
            "people": userInfo.people,
            "owner_type": userInfo.owner_type,
            "automobile": dicArray
        ]
        let header: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "Token \(token)"
        ]
        self.post(url: "http://142.93.160.186/reg/users/", parameters: parameters, header: header, completion: { (data) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                completion("\(data)")
            }
        }, error: error)
    }
    
    func putUserInfo(token: String, userInfo: UserInfo, id: Int, _ completion: @escaping (String)-> Void, _ error: @escaping (String)-> Void) {
        let dicArray = userInfo.automobile.map {
            $0.dictionaryRepresentation
        }
        let parameters: [String: Any] = [
            "full_name": userInfo.full_name,
            "address": userInfo.address,
            "flat": userInfo.flat,
            "floor": userInfo.floor,
            "people": userInfo.people,
            "owner_type": userInfo.owner_type,
            "automobile": dicArray
        ]
        let header: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "Token \(token)"
        ]
        self.put(url: "http://142.93.160.186/reg/userprofile/\(id)/", parameters: parameters, header: header, completion: { (data) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                completion("\(data)")
            }
        }, error: error)
    }
    
    func getNewsList(token: String, _ completion: @escaping ([NewsCellStruct])-> Void, _ error: @escaping (String)-> Void) {
        let header: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "Token \(token)"
        ]
        self.get(url: "http://142.93.160.186/news-api/news/", header: header, completion: {
            (data) in
            do {
                guard let data = data else {return}
                var newsList = try JSONDecoder().decode([NewsCellStruct].self, from: data)
                for index in (0...newsList.count - 1){
                    newsList[index].date = String(newsList[index].date.prefix(10))
                }
                DispatchQueue.main.async {
                    completion(newsList)
                }
            } catch let err {
                error(err.localizedDescription)
            }
        }, error: error)
    }
    
    func getImage(url: String, _ completion: @escaping (UIImage) -> Void, _ error: @escaping (String) -> Void){
        self.get(url: url, header: [:], completion: { (data) in
            do {
                guard let data = data else {return}
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image!)
                }
            }
        }, error: error)
    }
    
    func getRequestList(token: String, _ completion: @escaping ([RequestCellStruct]) -> Void, _ error: @escaping (String) -> Void){
    let header: [String: String] = [
            "Content-Type": "application/json",
            "Authorization": "Token \(token)"
    ]
    self.get(url: "http://142.93.160.186/service/service/", header: header, completion: {
        (data) in
        do {
            guard let data = data else {return}
            let requestList = try JSONDecoder().decode([RequestCellStruct].self, from: data)
            DispatchQueue.main.async {
                completion(requestList)
            }
        } catch let err {
                    error(err.localizedDescription)
                }
            }, error: error)
}
    
    func postRequest(token: String, request: RequestCellStruct, _ completion: @escaping (String) -> Void, _ error: @escaping (String) -> Void){
        let header: [String: String] = [
                   "Content-Type": "application/json",
                   "Authorization": "Token \(token)"
               ]
        let parameters: [String: Any] = [
                "service_type" : request.service_type,
                "status" : request.status,
                "description" : request.description
            ]
        self.post(url: "http://142.93.160.186/service/service/", parameters: parameters, header: header, completion: {
            (data) in
            print(data ?? "success")
        }, error: error)
    }
}


