//
//  MoviesHome.swift
//  MoviesApp
//
//  Created by Jonathan Gracia on 12/05/22.
//

import Kingfisher
import UIKit
import FirebaseAuth

class MoviesHome: UIViewController {
    var movie: Array<Results> = MoviesExternalData.shared.Trending.results!
    @IBOutlet var PeliculasBtn: UIButton!
    @IBOutlet var TvBtn: UIButton!
    @IBOutlet var TodosBtn: UIButton!
    @IBOutlet var TrendingList: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenu()
        TrendingList.dataSource = self
        TrendingList.delegate = self
        TrendingList.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "moviecell")        // Do any additional setup after loading the view.
    }
    
    func setUpMenu() {
        var menuItems: [UIAction] {
            return [
                UIAction(title: "Profile", image: UIImage(systemName: "person.circle.fill"), handler: { (_) in
                }),
                UIAction(title: "SingOut",image: UIImage(systemName: "person.fill.xmark.rtl") , handler: { (_) in       do {
                    try Auth.auth().signOut()
                    self.navigationController?.popViewController(animated: true)
                }
                    catch{
                    }         }),
                
            ]        }
        
        var demoMenu: UIMenu {
            return UIMenu(title: "", image: UIImage(systemName: "ellipsis"), identifier: nil, options: [], children: menuItems)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", image: nil, primaryAction: nil, menu: demoMenu)
    }

        
    @IBAction func VerPeliculas(_ sender: Any) {
        MoviesViewModel.shared.VerPeliculas { newtrend in
            self.movie = newtrend.results!
            DispatchQueue.main.async {
                self.TrendingList.reloadData()
            }
        }
}

    @IBAction func VerTvShows(_ sender: Any) { viewDidLoad()
        MoviesViewModel.shared.VerTvShows { newtrend in
            self.movie = newtrend.results!
            DispatchQueue.main.async {
                self.TrendingList.reloadData()
            }
        }
    }
    @IBAction func VerTodo(_ sender: Any) {
        MoviesViewModel.shared.VerTodos { newtrend in
            self.movie = newtrend.results!
            DispatchQueue.main.async {
                self.TrendingList.reloadData()
            }
        }
    }
    @IBAction func ShowMenu(_ sender: Any) {
        /*do {
        try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
    }
        catch{
        }*/
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
