//
//  MoviesHome.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 12/05/22.
//

import Kingfisher
import UIKit
import FirebaseAuth

class MoviesHome: UIViewController {
    @IBOutlet weak var MenuBtn: UIBarButtonItem!
    var movie: Array<Results> = MoviesExternalData.shared.Trending.results!
    @IBOutlet var PeliculasBtn: UIButton!
    @IBOutlet var TvBtn: UIButton!
    @IBOutlet var TodosBtn: UIButton!
    @IBOutlet var TrendingList: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TrendingList.dataSource = self
        TrendingList.delegate = self
        TrendingList.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "moviecell")
        // Do any additional setup after loading the view.
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
        do {
        try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
    }
        catch{
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
