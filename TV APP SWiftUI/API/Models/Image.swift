//
//  Image.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct ImageCodable : Identifiable, Codable {
    
    let id : String? = UUID().uuidString
    let medium : String?
    let original : String?

    enum CodingKeys: String, CodingKey {

        case medium = "medium"
        case original = "original"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        medium = try values.decodeIfPresent(String.self, forKey: .medium)
        original = try values.decodeIfPresent(String.self, forKey: .original)
    }
}
