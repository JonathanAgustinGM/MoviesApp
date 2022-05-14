//
//  Model.swift
//  MoviesApp
//
//  Created by Jordy Gracia on 12/05/22.
//

import Foundation


public struct TrendingList: Decodable {
    var page: Int?
    var results: Array<Results>?
}

public struct Results: Decodable {
    var adult: Bool?
    var original_title: String?
    var overview: String?
    var poster_path: String?
    var id: Int?
    var name: String?
    var media_type: String?
    var title: String?
    
}
