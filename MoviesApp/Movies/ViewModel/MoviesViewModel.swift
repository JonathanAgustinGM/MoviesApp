//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Jonathan Gracia on 14/05/22.
//

import Foundation

class MoviesViewModel {
    static let shared = MoviesViewModel()
    
    func VerPeliculas (succes: @escaping (_ newtrend: TrendingList) -> Void) {
        MoviesExternalData.shared.getTrendingList(type: "movies") { trending in
            MoviesExternalData.shared.Trending = trending
            let newtrend = trending
            succes(trending)
        } failure: { error in
            print(error!)
        }

    }
    func VerTvShows (succes: @escaping (_ newtrend: TrendingList) -> Void) {
        MoviesExternalData.shared.getTrendingList(type: "tv") { trending in
            MoviesExternalData.shared.Trending = trending
            let newtrend = trending
            succes(trending)
        } failure: { error in
            print(error!)
        }
        
    }
    func VerTodos (succes: @escaping (_ newtrend: TrendingList) -> Void) {
        MoviesExternalData.shared.getTrendingList(type: "all") { trending in
            MoviesExternalData.shared.Trending = trending
            let newtrend = trending
            succes(trending)
        } failure: { error in
            print(error!)
        }
        
    }
    
}
