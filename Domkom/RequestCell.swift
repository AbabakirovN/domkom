//
//  RequestCell.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/12/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class RequestCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func configure(request: RequestCellStruct) {
        switch request.status {
        case "RD":
            icon.image = UIImage(named: "AcceptedIcon")
            break
        default:
            icon.image = UIImage(named: "RefreshIcon")
        }
        num.text = "Заявка №\(request.id)"
        switch request.service_type {
        case "TE":
            type.text = "Пропуск"
            break
        case "RE":
            type.text = "Ремонт"
            break
        default:
            type.text = "Доп. услуги"
        }
        type.text = "Тип заявки: " + type.text!
        
    }
}
