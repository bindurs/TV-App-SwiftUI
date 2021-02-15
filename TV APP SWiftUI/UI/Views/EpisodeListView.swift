//
//  EpisodeListView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 19/02/21.
//

import SwiftUI
import Combine

struct EpisodeListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var gridItemLayout = [GridItem(.flexible())]
    var series:Series?
    var seasons: [Season]
    @State var selectedSeason : Int
    @ObservedObject var apiHandler = APIHandler()
    
    var body: some View {
        
        ZStack (alignment:.top) {
            Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)).ignoresSafeArea()
            BlurredImageView(image: series?.image?.original)
            
            VStack {
                WhiteText(fontName: "ChalkboardSE-Bold", fontSize: 25, string: series?.name ?? "[ Series Name ]")
                    .padding(.top, 10)
                
                EpisodeListDetails(series: series, seasons: seasons, episodesArray: apiHandler.episodes, selectedSeason: selectedSeason, currentPage: "\(selectedSeason)")
                    .padding(.horizontal, 10)
                }
            
            ActivityIndicator(isAnimating: .constant(apiHandler.loading), style: .large)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150 , alignment: .center)
        }
        .onAppear(perform: {
            apiHandler.fetchData(fromPath: "\(ApiUrls.shows)\(series?.id ?? 0)\(ApiUrls.episodes)", forParams: [], forApiType: .listEpisodes, forMappingModel: [Episode].self)
        })
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image("backBtn")
        })
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    func setBackgroundColor(page: Int) -> Color {
        if (page%2 == 0) {
            return .orange
        } else {
            return .blue
        }
    }
}

//struct EpisodeCellView: View {
//
//    var series: Series?
//    var episodesArray: [Episode]?
//    var season: [Season]
//    @State var selectedSeason : Int
//
//    var body: some View {
//
//
//    }
//}

struct EpisodeListDetails: View {
    
    var gridItemLayout = [GridItem(.flexible())]
    var series:Series?
    var seasons: [Season]
    var episodesArray: [Episode]?
    
    @State var selectedSeason: Int
    @State var currentPage: String
    @State var items: [String] = ["1", "2", "3"]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout) {
                ForEach(seasons) { season in
                    SeasonCollectionViewCell(number: "\(season.number ?? 1)", series: series, seasons: seasons)
                        .onTapGesture(perform: {
                            selectedSeason = season.number ?? 1
                            currentPage = "\(selectedSeason)"
                        })
                        .frame(height: 50)
                        .background(selectedSeason == season.number ? Color(.brown) : Color(#colorLiteral(red: 0.4980392157, green: 0.4980392157, blue: 0.4980392157, alpha: 1)))
                        .cornerRadius(25)
                }
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 50, alignment: .center)
        }
        TabView(selection: $currentPage) {
            ForEach(seasons) { item in
                VStack {
                    WhiteText(fontName: "ChalkboardSE-Bold", fontSize: 25, string:"Season \(selectedSeason)")
                    WhiteDivider()
                    ScrollView {
                        let episodes = episodesArray?.filter({$0.airedSeason == selectedSeason}) ?? [Episode]()
                        ForEach(Array(zip(episodes.indices, episodes)), id: \.0) { (index, episode) in
                                EpisodeCell(episodeData: (index + 1, episode, series))
                        }
                    }
                }
                .tag("\(item.number ?? 0)")
            }
        }.tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onReceive(Just(currentPage), perform: { page in
            currentPage = page
        })
        .onChange(of: currentPage, perform: { value in
            selectedSeason = Int(currentPage) ?? 0
        })
    }
}
struct EpisodeListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListView(seasons: [Season](), selectedSeason: 1)
    }
}
