//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 13/05/22.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeViewModel {
    let view = Home()
    static let shared = HomeViewModel()
    func SingIn(email: String, password: String) {
   
    }
    func SingUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let result = result, error == nil {
                DispatchQueue.main.async {
                self.view.performSegue(withIdentifier: "movieshomesegue", sender: self)
                }
        }
                                }
     
}
