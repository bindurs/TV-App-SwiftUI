//
//  CastCrew.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct CastCrew : Codable, Identifiable {
    let id = UUID().uuidString
    let person : Person?
    let character : Person?
    let isSelf : Bool?
    let isVoice : Bool?
    let type : String?

    enum CodingKeys: String, CodingKey {

        case person = "person"
        case character = "character"
        case isSelf = "self"
        case isVoice = "voice"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        person = try values.decodeIfPresent(Person.self, forKey: .person)
        character = try values.decodeIfPresent(Person.self, forKey: .character)
        isSelf = try values.decodeIfPresent(Bool.self, forKey: .isSelf)
        isVoice = try values.decodeIfPresent(Bool.self, forKey: .isVoice)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
