//
//  EpisodeCell.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 19/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EpisodeCell: View {
    
    var episodeData: (Int?, Episode?, Series?)
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            WhiteText(fontSize:21, string: "\(String(format: "%02d", episodeData.0 ?? 0)) - \(episodeData.1?.episodeName ?? "")")
                //.padding(.top, 20)
            WhiteText(string: "Aired Date : \(episodeData.1?.airdate?.dateToString ?? "")")
            NavigationLink(
                destination:EpisodeDetailsView(series: episodeData.2, episode: episodeData.1)) {
                WebImage(url: URL(string: episodeData.1?.image?.original ?? AppConstants.placeholderUrl), isAnimating: .constant(true))
                    .placeholder{Image("no-img")}
                    .resizable()
                    .scaledToFill()
                    .frame(width: AppConstants.screenWidth, height: AppConstants.screenWidth, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
            }
            WhiteText(string: (episodeData.1?.summary ?? "").removeTags)
                .padding(.bottom, 20)
            WhiteDivider(height: 1, width: UIScreen.main.bounds.size.width - 50)
        }
        .padding(.horizontal, 10)
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCell()
    }
}
