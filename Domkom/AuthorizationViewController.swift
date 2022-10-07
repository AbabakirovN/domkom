//
//  AuthorizationViewController.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 2/20/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var phoneAlert: UILabel!
    @IBOutlet weak var phoneField: UITextField!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendCode(_ sender: Any) {
        if phoneField.text?.count != 9 {
            phoneAlert.text = "Номер телефона должен состоять из 9 цифр"
            phoneAlert.isHidden = false
            return
        }
        let phoneNumber = "+996" + phoneField.text!
        Auth.auth().languageCode = "ru";
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print(error!)
                self.phoneAlert.text = "Unknown Error"
                self.phoneAlert.isHidden = false
                return
            }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "AuthentificationVC") as! AuthentificationViewController
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.verificationID = verificationID!
        secondViewController.phoneNumber = phoneNumber
        self.present(secondViewController, animated: true, completion: nil)
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
