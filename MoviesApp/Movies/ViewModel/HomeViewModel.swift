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
    func SignIn(email: String, password: String,succes: @escaping (_ succesuser: AuthDataResult) -> Void,failure: @escaping (_ error: Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let result = result, error == nil {
            print(result)
                succes(result)
            }
            else {
                failure(error!)
            }
                }
            }
    func SingUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let result = result, error == nil {
                
                }
        
                                }
     
}

}
