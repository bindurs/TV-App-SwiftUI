//
//  Series.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct Series : Identifiable, Codable {
    let id : Int?
    let seriesURL : String?
    let name : String?
    let type : String?
    let language : String?
    let status : String?
    let runtime : Int?
    let premiered : String?
    let officialSite : String?
    let rating : Rating?
    let weight : Int?
    let image : ImageCodable?
    let summary : String?
    let updated : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case seriesURL = "url"
        case name = "name"
        case type = "type"
        case language = "language"
        case status = "status"
        case runtime = "runtime"
        case premiered = "premiered"
        case officialSite = "officialSite"
        case rating = "rating"
        case weight = "weight"
        case image = "image"
        case summary = "summary"
        case updated = "updated"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        seriesURL = try values.decodeIfPresent(String.self, forKey: .seriesURL)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        premiered = try values.decodeIfPresent(String.self, forKey: .premiered)
        officialSite = try values.decodeIfPresent(String.self, forKey: .officialSite)
        rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
        weight = try values.decodeIfPresent(Int.self, forKey: .weight)
        image = try values.decodeIfPresent(ImageCodable.self, forKey: .image)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        updated = try values.decodeIfPresent(Int.self, forKey: .updated)
    }
}

