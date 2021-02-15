//
//  Country.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct Country : Identifiable, Codable {
    
    let id : Int?
    let name : String?
    let code : String?
    let timezone : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case code = "code"
        case timezone = "timezone"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    }

}
