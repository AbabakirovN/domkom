//
//  AuthentificationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthentificationViewController: UIViewController {
    
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var codeAlert: UILabel!
    var verificationID:String = ""
    var phoneNumber:String = ""
    var token:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeField.keyboardType = .numberPad
    }
    
    @IBAction func signIn(_ sender: Any) {
        if !isCorrect() {
            return
        }
        
        let verificationCode = codeField.text!
        let credential = PhoneAuthProvider.provider().credential(
        withVerificationID: verificationID,
        verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            print(error)
            self.codeAlert.text = "Неправильно введен код"
            self.codeAlert.isHidden = false
            return
          }
            ServerManager.shared.getProfileInfo(token: self.token, { (data) in
                UserDefaults.standard.set(self.token, forKey: "token")
                if data.count == 0 {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextVC = storyboard.instantiateViewController(withIdentifier: "RegistrationVC")
                    nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true, completion: nil)
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyboard.instantiateViewController(withIdentifier: "MainVC")
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true, completion: nil)
                }
            }) { (error) in
                print(error)
            }
            
        }
    }
    
    func isCorrect() -> Bool {
        if codeField.text?.count != 6 {
            if !codeField.text!.isInt {
                codeAlert.text = "Код должен состоять из 6 цифр"
                codeAlert.isHidden = false
                return false
            }
        }
        return true
    }
}
