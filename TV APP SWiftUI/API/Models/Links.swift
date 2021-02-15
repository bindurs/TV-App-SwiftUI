//
//  Links.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import Foundation

struct Links : Codable, Identifiable {
    
    let id : String? = UUID().uuidString
    let linkSelf : LinkSelf?

    enum CodingKeys: String, CodingKey {

        case linkSelf = "self"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        linkSelf = try values.decodeIfPresent(LinkSelf.self, forKey: .linkSelf)
    }

}
