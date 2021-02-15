//
//  Constants.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation
import UIKit


struct AppConstants {
    static let screenWidth = UIScreen.main.bounds.size.width/2
    static let dateFormat = "dd MMM yyyy"
    static let dateFormatApi = "yyyy-MM-dd"
    static let placeholderUrl = "http://via.placeholder.com/350/ffffff/000000?text=Image+Not+found"
}
struct ApiUrls {
    static let baseUrl = "https://api.tvmaze.com"
    static let search = "/search/shows"
    static let show = "/show/"
    static let shows = "/shows/"
    static let episodes = "/episodes"
    static let season = "/seasons"
    static let cast = "/cast"
    static let crew = "/crew"
    static let placeholderUrl = "http://via.placeholder.com/350/ffffff/000000?text=Image+Not+found"
    static let dateFormat = "dd MMM yyyy"
    static let dateFormatApi = "yyyy-MM-dd"
    
}

enum APIType {
    case listSeries
    case listSearchSeries
    case listseasons
    case listEpisodes
    case listCast
    case listCrew
}

enum AppError : Error {
    case invalidFormat
}
