//
//  Model.swift
//  Domkom
//
//  Created by Adakhanau on 03.03.2020.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let id: Int
    let full_name, address: String
    let flat, floor, people: Int
//    let owner_type: String
    let automobile: [AutomobileProfile]
}

// MARK: - Automobile
struct AutomobileProfile: Codable {
    let id: Int
    let car_brand, car_model, car_number: String
    
}

struct User: Codable {
    var user_id: Int
    var token: String
}

struct NewsCellStruct: Codable {
    var id: Int
    var title:String
    var image:String
    var text: String
    var date:String
}

struct RequestCellStruct: Codable {
    let id: Int
    let service_type: String
    let status: String
    let description: String
}

struct UserInfo: Codable {
    let full_name, address, owner_type: String
    let flat, floor, people: Int
    let automobile: [Automobile]
}

struct Automobile: Codable {
    let car_brand, car_model, car_number: String
    var dictionaryRepresentation: [String: Any]{
        return [
            "car_brand" : car_brand,
            "car_model" : car_model,
            "car_number" : car_number
        ]
    }
}
