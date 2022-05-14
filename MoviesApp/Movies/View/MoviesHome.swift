//
//  MoviesHome.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 12/05/22.
//

import Kingfisher
import UIKit
class MoviesHome: UIViewController {
    var movie: Array<Results> = MoviesExternalData.shared.Trending.results!
    @IBOutlet var PeliculasBtn: UIButton!
    @IBOutlet var TvBtn: UIButton!
    @IBOutlet var TodosBtn: UIButton!
    @IBOutlet var TrendingList: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        movie = MoviesExternalData.shared.Trending.results!
        TrendingList.reloadData()

        TrendingList.dataSource = self
        TrendingList.delegate = self
        TrendingList.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "moviecell")
        // Do any additional setup after loading the view.
    }

    @IBAction func VerPeliculas(_ sender: Any) {
        MoviesViewModel.shared.VerPeliculas { _ in
            self.movie = MoviesExternalData.shared.Trending.results!
            DispatchQueue.main.async {
                self.viewDidLoad()
            }
        }
    }

    @IBAction func VerTvShows(_ sender: Any) { viewDidLoad()
        MoviesViewModel.shared.VerTVShows { _ in
            self.movie = MoviesExternalData.shared.Trending.results!

            DispatchQueue.main.async {
                self.viewDidLoad()
            }
        }
    }

    @IBAction func VerTodo(_ sender: Any) {
        MoviesViewModel.shared.VerTodos { _ in
            self.movie = MoviesExternalData.shared.Trending.results!

            DispatchQueue.main.async {
                self.viewDidLoad()
            }
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
