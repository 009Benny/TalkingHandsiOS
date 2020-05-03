//
//  RegisterViewController.swift
//  TalkingHandsApp
//
//  Created by Sandra on 22/04/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var viewContainer: UIView?
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var aliasTextField: UITextField?
    @IBOutlet weak var dateTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    var delegate:ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewContainer?.layer.cornerRadius = 10
    }
    
    func configTextFields(){
        self.nameTextField?.delegate = self
        self.aliasTextField?.delegate = self
        self.dateTextField?.delegate = self
        self.emailTextField?.delegate = self
        self.passwordTextField?.delegate = self
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Button Actions
    @IBAction func btnRegisterAction(_ sender: Any) {
        let data:[String:Any] = [
            "name":self.nameTextField?.text ?? "",
            "nickname":self.aliasTextField?.text ?? "",
            "birthday":self.dateTextField?.text ?? "",
            "email":self.emailTextField?.text ?? "",
            "pass":self.passwordTextField?.text ?? ""
        ]
        UserDefaults.standard.set(data, forKey: "user")
        UserDefaults.standard.synchronize()
        self.dismiss(animated: true, completion: nil)
    }

}
