//
//  ExternalData.swift
//  MoviesApp
//
//  Created by Jonathan Gracia on 12/05/22.
//

import Foundation

class MoviesExternalData {
    private init () {()}
    static let shared = MoviesExternalData()
    var Trending = TrendingList()
    var singleMovie = SingleMovie()
    //var userEmail = ""
    let baseUrl = "https://api.themoviedb.org/3/"
    let apikey = "?api_key=3b8c2d08270f557db603feb93ca32ec8"
    
    func getTrendingList (type: String, succes: @escaping (_ trending: TrendingList) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        let url = URL(string: "\(baseUrl)trending/\(type)/day\(apikey)&language=es")
        URLSession.shared.dataTask(with: url!) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let trendinglist = try? JSONDecoder().decode(TrendingList.self, from: data!)
                succes(trendinglist!)
                self.Trending = trendinglist!
                
            }
        }.resume()
    }
    func getSingleMovie (id: Int, media: String, succes: @escaping (_ singlemovie: SingleMovie ) -> Void, failure: @escaping (_ error: Error?) -> Void) {
    let url = URL(string: "\(baseUrl)/\(media)/\(id)\(apikey)&language=es")
    URLSession.shared.dataTask(with: url!) { data, _, error in
        if let error = error {
            print(error.localizedDescription)
        } else {
            let singlemovie = try? JSONDecoder().decode(SingleMovie.self, from: data!)
            succes(singlemovie!)
            self.singleMovie = singlemovie!

            
        }
    }.resume()
    }
}
