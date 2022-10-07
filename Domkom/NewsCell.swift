//
//  NewsCell.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/12/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsComs: UILabel!
    
 
    func configure(news: NewsCellStruct) {
        newsTitle.text = news.title
        fixDate(dateNewsT: news.date)
        ServerManager.shared.getImage(url: news.image, { (image) in
            self.newsImage.image = image
        }, { (error) in
            self.newsImage.image = UIImage(named: "LaunchBackground")
        })
        newsComs.text = "Количество комментариев: "
    }
    
    func fixDate(dateNewsT: String){
       
    //        year = dateNewsT
            let year = dateNewsT.substring(to: 4)
            let month = dateNewsT.substring(with: 5..<7)
            var day = dateNewsT.substring(from: 8)
            
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
        if (day.substring(to: 1) == "0") {
            day = "" + day.substring(with: 1..<2)
        }
            newsDate.text = day + " " + monthLabel + ", " + year
        }
    
}
