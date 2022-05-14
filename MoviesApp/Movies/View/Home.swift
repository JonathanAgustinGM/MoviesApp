//
//  ViewController.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 12/05/22.
//

import UIKit
import FirebaseAuth
class Home: UIViewController{
   

    @IBOutlet weak var EmailTextfield: UITextField!
    @IBOutlet weak var Singin: UIButton!
    @IBOutlet weak var registerboton: UIButton!
    @IBOutlet weak var paswordtextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailTextfield.delegate = self
        paswordtextfield.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func RegistrarBoton(_ sender: Any) {
        if let useremail = EmailTextfield.text, let userpassword = paswordtextfield.text {
        HomeViewModel.shared.SingUp(email: useremail, password: userpassword)
    }
    }
    @IBAction func SingConfirm(_ sender: Any) {
        if let email = EmailTextfield.text, let password = paswordtextfield.text{
       IniciarSesion(email: email, password: password)
        
        
        }
}
    func IniciarSesion(email:String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let result = result, error == nil {
                MoviesExternalData.shared.getTrendingList(type: "all") { trending in
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "movieshomesegue", sender: self)
                    }
                } failure: { error in
                    print("n oData")
                }

                
        }

}
    }
}

extension Home: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
}
}
