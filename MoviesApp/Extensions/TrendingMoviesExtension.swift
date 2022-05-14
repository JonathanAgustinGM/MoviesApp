//
//  TrendingMoviesExtension.swift
//  MoviesApp
//
//  Created by Jonathan Gracia on 12/05/22.
//

import Foundation
import Kingfisher
import UIKit

extension MoviesHome: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MoviesExternalData.shared.Trending.results?.count ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TrendingList.dequeueReusableCell(withReuseIdentifier: "moviecell", for: indexPath) as? MovieCell

        cell?.MovieDescription.text = movie[indexPath.row].overview
        cell?.MovieImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w185/\(movie[indexPath.row].poster_path!)"))
        if movie[indexPath.row].title != nil {
            cell?.Title.text = movie[indexPath.row].title
        } else {
            cell?.Title.text = movie[indexPath.row].name
       
    }
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 2, height: 250
        )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MoviesExternalData.shared.getSingleMovie(id: movie[indexPath.row].id!, media: movie[indexPath.row].media_type!) { [self] singlemovie in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "descriptionsegue", sender: self)
            }
        } failure: { error in
            print(error!)
        }
    }
}
