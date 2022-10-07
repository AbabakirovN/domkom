//
//  NewsViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/12/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit


class NewsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var data : [NewsCellStruct] = []

       override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
//        
        //ask Adakhan on the following problem:
        //Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[UIImageView _isSymbolImage]: unrecognized selector sent to instance 0x7ffab261fbc0'
    }
    
    func loadData(){
        data.append(NewsCellStruct(image: UIImage(named: "Car")!, title: "Cars", date: "12-12-2012", coms: 3))
        data.append(NewsCellStruct(image: UIImage(named: "Camera")!, title: "Camera", date: "12-12-2012", coms: 3))
        data.append(NewsCellStruct(image: UIImage(named: "LaunchBackground")!, title: "Hello", date: "12-12-2012", coms: 3))
        data.append(NewsCellStruct(image: UIImage(named: "Logo")!, title: "LOGORIPHM", date: "12-12-2012", coms: 3))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        cell.configure(news:news)
        return cell
    }
    
   
    // MARK: - Table view data source

   

   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

