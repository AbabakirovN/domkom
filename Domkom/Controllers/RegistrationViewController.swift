//
//  RegistrationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    var owner:Bool = true
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var appartmentField: UITextField!
    @IBOutlet weak var floorField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var cariField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carField: UITextField!

    @IBOutlet weak var lineBlue: UIImageView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var ownerButton: UIButton!
    @IBOutlet weak var notownerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        appartmentField.keyboardType = .numberPad
        peopleField.keyboardType = .numberPad
        floorField.keyboardType = .numberPad
        // Do any additional setup after loading the view.
    }
    @IBAction func notownerButton(_ sender: Any) {
    owner = false
    }
    @IBAction func ownerButton(_ sender: Any) {
        owner = true
        
    }
    @IBAction func yesButton(_ sender: Any) {
        yesButton.setBackgroundImage(UIImage(named: "ButtonBlue"), for: UIControl.State.normal)
        noButton.setBackgroundImage(UIImage(named: "ButtonGray"), for: UIControl.State.normal)
        carLabel.isHidden = false
        carImage.isHidden = false
        carField.isHidden = false
       lineBlue.isHidden = false
        
        
        
    }
    @IBAction func noButton(_ sender: Any) {
        noButton.setBackgroundImage(UIImage(named: "ButtonBlue"), for: UIControl.State.normal)
        yesButton.setBackgroundImage(UIImage(named: "ButtonGray"), for: UIControl.State.normal)
        carLabel.isHidden = true
        carImage.isHidden = true
        carField.isHidden = true
        lineBlue.isHidden = true
        carField.text = ""
        
    }
    
    
    @IBAction func saveInfo(_ sender: Any) {
        
        if nameField.text != "" && addressField.text != "" && appartmentField.text != "" && floorField.text != ""  {
            if appartmentField.text!.isInt && peopleField.text!.isInt && floorField.text!.isInt {
                
            let full_name = nameField.text!
            let address = addressField.text!
            let owner_type = owner ? "Владеледец" : "Арендатор"
            let flat = Int(appartmentField.text!)!
            let floor = Int(floorField.text!)!
            let people = Int(peopleField.text ?? "0")!
                var autos:[Automobile]
                if carField.text == "" {
                    autos = []
                } else {
                    autos = [Automobile(car_brand: carField.text!, car_model: "NULL", car_number: "0000")]
                    
                }
            let automobiles = autos
            
            let userInfo = UserInfo(full_name: full_name, address: address, owner_type: owner_type, flat: flat, floor: floor, people: people, automobile: automobiles)
            
           ServerManager.shared.postUserInfo(token: UserDefaults.standard.value(forKey: "token") as! String, userInfo: userInfo, { (successMessage) in
               print(successMessage)
            self.nextVC(identifier: "MainVC")
            }) { (error) in
               print(error)
            }
            } else {
                let alert = UIAlertController(title: "Неправильный ввод", message: "Пожалуйста, введите цифры в поля Квартира, Этаж и Кол-во проживающих людей.", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                           self.present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Неправильный ввод данных", message: "Заполните все необходимые поля. Поля обязательные для заполнения выделены звёздочкой.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
       }
        
    }
    
    func nextVC(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
        nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
    }
}
