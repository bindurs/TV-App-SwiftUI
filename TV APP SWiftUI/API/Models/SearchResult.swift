//
//  SearchResult.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct SearchResult : Codable {
    let score : Double?
    let series : Series?

    enum CodingKeys: String, CodingKey {

        case score = "score"
        case series = "show"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        score = try values.decodeIfPresent(Double.self, forKey: .score)
        series = try values.decodeIfPresent(Series.self, forKey: .series)
    }

}
