//
//  SeasonCollectionViewCell.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 18/02/21.
//

import SwiftUI

struct SeasonCollectionViewCell: View {
    
    var number: String?
    var series: Series?
    var seasons: [Season]
    
    var body: some View {
        
        VStack {
            Text(number ?? "")
        }
        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .font(.custom("ChalkboardSE-Regular", size: 16))
        .foregroundColor(.white)
    }
}

struct SeasonCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SeasonCollectionViewCell(seasons: [Season]())
    }
}
