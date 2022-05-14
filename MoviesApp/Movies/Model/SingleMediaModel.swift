//
//  SingleMovieModel.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 13/05/22.
//

import Foundation
struct SingleMovie: Decodable {
    var adult: Bool?
    var id: Int?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var relase_date: String?
    var tagline: String?
    var title: String?
    var backdrop_path: String?
    var genres: Array<Genres>?
    var original_title: String?
    var number_of_seasons: Int?
    var name: String?
    var homepage: String?

}

struct Genres: Decodable {
    var name: String?
}
