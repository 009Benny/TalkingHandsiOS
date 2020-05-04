//
//  LogInViewController.swift
//  TalkingHandsApp
//
//  Created by Sandra on 22/04/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class LogInViewController: RegisterViewController {

    @IBOutlet weak var lblerror: UILabel?

    override func btnRegisterAction(_ sender: Any) {
        //AHORA es ingresar
        if let user = UserDefaults.standard.object(forKey: "user") as? NSDictionary{
            let email:String = self.emailTextField?.text ?? ""
            let pass = self.passwordTextField?.text ?? ""
            if user.object(forKey: "email") as? String ?? "" == email {
                self.dismiss(animated: true) {
                    self.delegate?.showMenu()
                }
            }else{
                self.lblerror?.text = "Constraseña o correo incorrectos, favor de intentar de nuevo."
                self.emailTextField?.text = ""
                self.passwordTextField?.text = ""
            }
        }else{
            self.lblerror?.text = "Hubo un error al conectarse, favor intentarlo mas tarde."
        }
    }
}
