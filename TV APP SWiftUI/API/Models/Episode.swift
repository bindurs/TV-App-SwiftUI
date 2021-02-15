//
//  Episode.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct Episode : Codable, Identifiable {
    let id : Int?
    let episodeURL : String?
    let episodeName : String?
    let airedSeason : Int?
    let episodeNumber : Int?
    let airdate : String?
    let airtime : String?
    let airstamp : String?
    let runtime : Int?
    let image : ImageCodable?
    let summary : String?
    let links : Links?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case episodeURL = "url"
        case episodeName = "name"
        case airedSeason = "season"
        case episodeNumber = "number"
        case airdate = "airdate"
        case airtime = "airtime"
        case airstamp = "airstamp"
        case runtime = "runtime"
        case image = "image"
        case summary = "summary"
        case links = "_links"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        episodeURL = try values.decodeIfPresent(String.self, forKey: .episodeURL)
        episodeName = try values.decodeIfPresent(String.self, forKey: .episodeName)
        airedSeason = try values.decodeIfPresent(Int.self, forKey: .airedSeason)
        episodeNumber = try values.decodeIfPresent(Int.self, forKey: .episodeNumber)
        airdate = try values.decodeIfPresent(String.self, forKey: .airdate)
        airtime = try values.decodeIfPresent(String.self, forKey: .airtime)
        airstamp = try values.decodeIfPresent(String.self, forKey: .airstamp)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        image = try values.decodeIfPresent(ImageCodable.self, forKey: .image)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
    }

}
