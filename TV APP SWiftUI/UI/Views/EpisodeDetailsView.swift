//
//  EpisodeDetailsView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 22/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EpisodeDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var series:Series?
    var episode: Episode?
    
    var body: some View {
        
        ZStack (alignment:.top) {
            Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)).ignoresSafeArea()
            BlurredImageView(image: series?.image?.original)
            
                ScrollView {
                    
                    WhiteText(fontName:"ChalkboardSE-Bold", fontSize: 25, string: "\(series?.name ?? "[Series Name]")")

                    WhiteText(fontSize: 22, string: "Season \(episode?.airedSeason ?? 0)")
                    WhiteDivider(width: UIScreen.main.bounds.size.width - 50)

                    WhiteText(fontSize: 20, string: String(format: "%02d - \(episode?.episodeName ?? "[Episode Name]")", episode?.episodeNumber ?? 00))
                        WhiteText(string: "Aired Date : \(episode?.airdate?.dateToString ?? "[Aired Date]")")
                        WebImage(url: URL(string: episode?.image?.original ?? AppConstants.placeholderUrl), isAnimating: .constant(true))
                            .placeholder{Image("no-img")}
                            .resizable()
                            .scaledToFill()
                            .frame(width: AppConstants.screenWidth, height: AppConstants.screenWidth, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
                        WhiteText(string: episode?.summary?.removeTags ?? "[ Episode Summary ]")
                
                    WhiteDivider(width: UIScreen.main.bounds.size.width - 50)
                    VStack(alignment: .leading, spacing: 10) {
                        DetailsViewHStack(title: "Run Time", desc: "\(episode?.runtime ?? 0) min")
                        DetailsViewHStack(title: "Url", desc: episode?.episodeURL ?? "[ Episode Url ]")
                    }
                    WhiteDivider(width: UIScreen.main.bounds.size.width - 50)
                }
            
            .padding() 
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image("backBtn")
        })
    }
}

struct EpisodeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailsView()
    }
}
