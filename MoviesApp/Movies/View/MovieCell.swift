//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Jonathan Gracia on 12/05/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var MovieDescription: UILabel!
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
