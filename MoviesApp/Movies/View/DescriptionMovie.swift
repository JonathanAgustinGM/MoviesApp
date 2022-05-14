//
//  DescriptionMovie.swift
//  MoviesApp
//
//  Created by Jonathan Gracia on 13/05/22.
//

import UIKit
import Kingfisher

class DescriptionMovie: UIViewController {
    let media = MoviesExternalData.shared.singleMovie

    @IBOutlet weak var DatosTable: UITableView!
    @IBOutlet weak var Titulo: UILabel!
    @IBOutlet weak var Poster: UIImageView!
    @IBOutlet weak var Reseña: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        DatosTable.dataSource = self
        if media.number_of_seasons != nil {
            Titulo.text = media.name }
        else {
                Titulo.text = media.title!
        }
      
        Reseña.text = media.overview!
        Poster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w185\(media.poster_path!)"))


        // Do any additional setup after loading the view.
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
