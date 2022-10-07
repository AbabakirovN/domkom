//
//  RequestViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/27/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var requests : [RequestCellStruct] = []

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let request = requests[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell") as! RequestCell
        cell.configure(request: request)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    //
    func loadData(){
        ServerManager.shared.getRequestList(token: UserDefaults.standard.value(forKey: "token") as! String, { (requestsList) in
            self.requests = requestsList
            self.tableView.reloadData()
        }, {(error) in print(error)})
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
