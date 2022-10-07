//
//  AuthorizationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
import FirebaseAuth

class AuthorizationViewController: UIViewController {

    var isNew : Bool = false
    var token:String = ""
    @IBOutlet weak var phoneAlert: UILabel!
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        let checker = UserDefaults.standard.value(forKey: "token") as? String ?? "nil"
        print(checker)
        if  checker != "nil" && !isNew{
            print("saved")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "MainVC") as! UITabBarController
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
            
        }
        isNew = true
    }
    
    
    @IBAction func sendCode(_ sender: Any) {
        if !isCorrect() {
            return
        }
        var doExist = false
        let phoneNumber = "+996" + phoneField.text!
        ServerManager.shared.postPhone(phone: "0" + phoneField.text!, { (user) in
            print(user.token)
            self.token = user.token
            doExist = true
        }, { (error) in
            print(error)
            doExist = false
        })		
        Auth.auth().languageCode = "ru";
        
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print(error!)
                self.phoneAlert.text = "Ошибка: ввод капчи обязателен или попробуйте ввести номер позже"
                self.phoneAlert.isHidden = false
                return
            }
        if !doExist {
            print("not found")
            self.phoneAlert.text = "Данный номер не существует, проверьте правильность набора номера"
            self.phoneAlert.isHidden = false
            return
        }
        self.nextVC(identifier: "AuthentificationVC", verificationID: verificationID!, phoneNumber: phoneNumber)
        }
    }

    func nextVC(identifier: String, verificationID: String, phoneNumber: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: identifier) as! AuthentificationViewController
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.verificationID = verificationID
        secondViewController.phoneNumber = phoneNumber
        secondViewController.token = self.token
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func isCorrect() -> Bool {
        if phoneField.text?.count != 9 {
            phoneAlert.text = "Номер телефона должен состоять из 9 цифр"
            phoneAlert.isHidden = false
            return false
        }
        if !phoneField.text!.isInt {
            phoneAlert.text = "Номер телефона должен состоять из цифр"
            phoneAlert.isHidden = false
            return false
        }
        return true
    }

}
