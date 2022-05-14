//
//  ViewController.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 12/05/22.
//

import UIKit

class Home: UIViewController {
   

    @IBOutlet weak var Singin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SingConfirm(_ sender: Any) {
        MoviesExternalData.shared.getTrendingList(type: "all") { [self] trending in
            DispatchQueue.main.async {
                
                self.performSegue(withIdentifier: "movieshomesegue", sender: self)
            }
        } failure: { error in
            print(error!)
        }
        
        
    
}

}
