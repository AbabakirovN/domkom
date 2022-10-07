//
//  AddRequestViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/19/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class AddRequestViewController: UIViewController {

    @IBOutlet var requests: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DisplayRequests(_ sender: UIButton) {
        requests.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
            })
        }
    }
    
    @IBAction func setType(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "Unknown")
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
