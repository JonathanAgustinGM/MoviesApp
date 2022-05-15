//
//  ProfileView.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 15/05/22.
//

import Foundation
import UIKit

class ProfileView: UIViewController{
    @IBOutlet weak var BienvenidaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        BienvenidaLabel.text = "Hola \(MoviesExternalData.shared.userEmail)"
    }
}
