//
//  Rating.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct Rating : Codable, Identifiable {
    
    let id: String? = UUID().uuidString
    let average : Double?

    enum CodingKeys: String, CodingKey {

        case average = "average"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        average = try values.decodeIfPresent(Double.self, forKey: .average)
    }
}
