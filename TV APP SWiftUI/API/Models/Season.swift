//
//  Season.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct Season : Codable, Identifiable {
    let id : Int?
    let url : String?
    let number : Int?
    let name : String?
    let episodeOrder : Int?
    let premiereDate : String?
    let endDate : String?
    let network : Network?
    let webChannel : String?
    let image : ImageCodable?
    let summary : String?
    let links : Links?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case url = "url"
        case number = "number"
        case name = "name"
        case episodeOrder = "episodeOrder"
        case premiereDate = "premiereDate"
        case endDate = "endDate"
        case network = "network"
        case webChannel = "webChannel"
        case image = "image"
        case summary = "summary"
        case links = "_links"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        episodeOrder = try values.decodeIfPresent(Int.self, forKey: .episodeOrder)
        premiereDate = try values.decodeIfPresent(String.self, forKey: .premiereDate)
        endDate = try values.decodeIfPresent(String.self, forKey: .endDate)
        network = try values.decodeIfPresent(Network.self, forKey: .network)
        webChannel = try values.decodeIfPresent(String.self, forKey: .webChannel)
        image = try values.decodeIfPresent(ImageCodable.self, forKey: .image)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
    }

}
