//
//  ProfileViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 6/5/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var id:Int = 0
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var appField: UITextField!
    @IBOutlet weak var floorField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var autoField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carLine: UIImageView!
    @IBOutlet weak var carField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getProfileInfo(token: UserDefaults.standard.value(forKey: "token") as! String, { (data) in
            self.nameField.text = data[0].full_name
            self.addressField.text = data[0].address
            self.appField.text = String(data[0].flat)
            self.floorField.text = String(data[0].floor)
            self.peopleField.text = String(data[0].people)
            self.autoField.text = data[0].automobile.isEmpty ? "" : data[0].automobile[0].car_brand
            self.id = data[0].id
            print(self.id)
        }) { (error) in
            print(error)
        }
    }
    
    @IBAction func yesButton(_ sender: Any) {
         yesButton.setBackgroundImage(UIImage(named: "ButtonBlue"), for: UIControl.State.normal)
         noButton.setBackgroundImage(UIImage(named: "ButtonGray"), for: UIControl.State.normal)
         carLabel.isHidden = false
         carImage.isHidden = false
         carField.isHidden = false
         carLine.isHidden = false
        
    }
    
    @IBAction func noButton(_ sender: Any) {
        noButton.setBackgroundImage(UIImage(named: "ButtonBlue"), for: UIControl.State.normal)
        yesButton.setBackgroundImage(UIImage(named: "ButtonGray"), for: UIControl.State.normal)
        carLabel.isHidden = true
        carImage.isHidden = true
        carField.isHidden = true
        carLine.isHidden = true
        carField.text = ""
    }
    
    @IBAction func signOut(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "token")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "Start")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func saveInfo(_ sender: Any) {
        let autos = autoField.text == "" ? [] : [Automobile(car_brand: autoField.text!, car_model: "NULL", car_number: "0000")]
        
        let userInfo = UserInfo(full_name: nameField.text!, address: addressField.text!, owner_type: "Владелец", flat: Int(appField.text ?? "0") ?? 0, floor: Int(floorField.text ?? "0") ?? 0, people: Int(peopleField.text ?? "0") ?? 0, automobile: autos)
        ServerManager.shared.putUserInfo(token: UserDefaults.standard.value(forKey: "token") as! String, userInfo: userInfo, id: self.id, { (data) in
            print("Success")
        }) { (error) in
            print(error)
        }
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
