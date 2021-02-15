//
//  Person.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct Person : Codable, Identifiable {
    let id : Int?
    let url : String?
    let name : String?
    let country : Country?
    let birthday : String?
    let deathday : String?
    let gender : String?
    let image : ImageCodable?
    let links : Links?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case url = "url"
        case name = "name"
        case country = "country"
        case birthday = "birthday"
        case deathday = "deathday"
        case gender = "gender"
        case image = "image"
        case links = "_links"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(Country.self, forKey: .country)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        deathday = try values.decodeIfPresent(String.self, forKey: .deathday)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        image = try values.decodeIfPresent(ImageCodable.self, forKey: .image)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
    }

}
