//
//  SeparateNewsViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 3/12/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class SeparateNewsViewController: UIViewController {

    
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var descNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    
    var titleNewsT = ""
    var imageNewsT = ""
    var descNewsT = ""
    var dateNewsT = ""
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        titleNews.text = titleNewsT
               ServerManager.shared.getImage(url: imageNewsT, { (image) in
                   self.imageNews.image = image
               }) { (error) in
                   self.imageNews.image = UIImage(named: "LaunchBackground")
               }
        descNews.text = descNewsT
        fixDate()
    }
    
    func configure(news:NewsCellStruct){
        titleNewsT = news.title
        imageNewsT = news.image
        descNewsT = news.text
        dateNewsT = news.date
    }
    func fixDate(){
   
//        year = dateNewsT
        let year = dateNewsT.substring(to: 4)
        let month = dateNewsT.substring(with: 5..<7)
        let day = dateNewsT.substring(from: 8)
        
        var monthLabel = ""
        switch month {
        case "01":
            monthLabel = "январь"
        case "02":
            monthLabel = "февраль"
        case "03":
            monthLabel = "март"
        case "04":
            monthLabel = "апрель"
        case "05":
            monthLabel = "май"
        case "06":
            monthLabel = "июнь"
        case "07":
            monthLabel = "июль"
        case "08":
            monthLabel = "август"
        case "09":
            monthLabel = "сентябрь"
        case "10":
            monthLabel = "октябрь"
        case "11":
            monthLabel = "ноябрь"
        default:
            monthLabel = "декабрь"
        }
        
        dateNews.text = day + " " + monthLabel + ", " + year
    }
}
