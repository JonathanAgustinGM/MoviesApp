//
//  ViewController.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 12/05/22.
//

import UIKit
import FirebaseAuth
class Home: UIViewController{
   

    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var EmailTextfield: UITextField!
    @IBOutlet weak var Singin: UIButton!
    @IBOutlet weak var registerboton: UIButton!
    @IBOutlet weak var paswordtextfield: UITextField!
    @IBOutlet weak var CargandoActivity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
       MoviesExternalData.shared.getTrendingList(type: "all") { trending in
            print("datos de inicio cargados")
        } failure: { error in
            print("No hay datos")
        }
        ErrorLabel.isHidden = true
        CargandoActivity.isHidden = true
        EmailTextfield.delegate = self
        paswordtextfield.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        paswordtextfield.text = ""
    }

    @IBAction func RegistrarBoton(_ sender: Any) {
        if let useremail = EmailTextfield.text, let userpassword = paswordtextfield.text {
        HomeViewModel.shared.SingUp(email: useremail, password: userpassword)
    }
    }
    @IBAction func SingConfirm(_ sender: Any) {
        CargandoActivity.isHidden = false
        CargandoActivity.startAnimating()
        if let email = EmailTextfield.text, let password = paswordtextfield.text{
       IniciarSesion(email: email, password: password)
        
        
        }
}
    func IniciarSesion(email:String, password: String) {
        if let useremail = EmailTextfield.text, let userpassword = paswordtextfield.text {
            ErrorLabel.isHidden = true
            HomeViewModel.shared.SignIn(email: useremail, password: userpassword) { [self] succesuser in
                CargandoActivity.stopAnimating()
                CargandoActivity.isHidden = true
                print("User Ok")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "movieshomesegue", sender: self)}
                    
                }
        failure: { [self] error in
            CargandoActivity.stopAnimating()
            CargandoActivity.isHidden = true
            ErrorLabel.text = "Usuario y contraseña invalidos o vacios"
            ErrorLabel.isHidden = false
            }

        }
 
    }
}
    
extension Home: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
}
}
