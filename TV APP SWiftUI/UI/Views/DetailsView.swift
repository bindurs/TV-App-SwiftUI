//
//  DetailsView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 17/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var apiHandler = APIHandler()
    
    var series:Series?
    var body: some View {
        ZStack (alignment:.top) {
            Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)).ignoresSafeArea()
            BlurredImageView(image: series?.image?.original)
            ScrollView {
                VStack {
                    Text(series?.name ?? "Sample")
                        .font(.custom("ChalkboardSE-Bold", size: 25))
                        .foregroundColor(.white)
                    
                    WebImage(url: URL(string: (series?.image?.original ?? AppConstants.placeholderUrl)), isAnimating: .constant(true))
                        .placeholder{Image("no-img")}
                        .resizable()
                        .scaledToFill()
                        .frame(width: AppConstants.screenWidth, height: (4/3) * AppConstants.screenWidth, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipped()
                    
                    VStack (alignment: .leading, spacing: 10) {
                        SeriesDetails(series: series)
                        WhiteDivider()
                        SeasonListView(seasons: apiHandler.seasons, series: series)
                        WhiteDivider()
                        CastAndCrewListView(casts: apiHandler.casts, crews: apiHandler.crews)
                    }
                    .padding(.horizontal, 20)
                }
                .offset(y:10)
            }
            ActivityIndicator(isAnimating: .constant(apiHandler.loading), style: .large)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150 , alignment: .center)
        }.onAppear(perform: {
            apiHandler.fetchData(fromPath: "\(ApiUrls.shows)\(series?.id ?? 0)\(ApiUrls.season)", forParams: [], forApiType: .listseasons, forMappingModel: [Season].self)
            apiHandler.fetchData(fromPath: "\(ApiUrls.shows)\(series?.id ?? 0)\(ApiUrls.cast)", forParams: [], forApiType: .listCast, forMappingModel: [CastCrew].self)
            apiHandler.fetchData(fromPath: "\(ApiUrls.shows)\(series?.id ?? 0)\(ApiUrls.crew)", forParams: [], forApiType: .listCrew, forMappingModel: [CastCrew].self)
            
        })
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image("backBtn")
        })
    }
    
}

struct CastAndCrewListView: View {
    
    var casts: [CastCrew]
    var crews: [CastCrew]
    @State var isCast: Bool = true
    @State var isCrew: Bool = false
    
    var body: some View {
        
        WhiteText(fontName: "ChalkboardSE-Bold", fontSize: 18, string: "Cast & Crew")
        VStack {
            VStack (spacing: 0) {
                HStack(spacing: 10) {
                    Button(action: {
                        isCast = true
                        isCrew = false
                    }, label: {
                        WhiteText(fontSize: 18, string: "Actors")
                    })
                    .frame(width: (AppConstants.screenWidth - 20), height: 40, alignment: .center)
                    
                    Button(action: {
                        isCast = false
                        isCrew = true
                    }, label: {
                        WhiteText(fontSize: 18, string: "Crew")
                    })
                    .frame(width: (AppConstants.screenWidth - 20), height: 40, alignment: .center)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 40, alignment: .center)
                HStack(spacing: 10) {
                    if isCast {
                        RoundCorneredRectangle()
                    } else {
                        RoundCorneredRectangle().hidden()
                    }
                    
                    if isCrew {
                        RoundCorneredRectangle()
                    } else {
                        RoundCorneredRectangle().hidden()
                    }
                }.frame(width: UIScreen.main.bounds.width - 40, height: 5, alignment: .center)
            }
            
            isCast ? CastCrewCell(isCast:true, castCrews: casts) : CastCrewCell(isCast: false, castCrews:crews)
        }
    }
}



struct SeasonListView: View {
    var seasons : [Season]
    var series: Series?
    var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        
        WhiteText(fontName: "ChalkboardSE-Bold", fontSize: 18, string: "Seasons")
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout) {
                ForEach(seasons) { season in
                    NavigationLink(destination: EpisodeListView(series:series, seasons:seasons,selectedSeason: season.number ?? 0)) {
                        
                        SeasonCollectionViewCell(number: "\(season.number ?? 0)", series: series, seasons:seasons)
                            .background(Color(#colorLiteral(red: 0.4980392157, green: 0.4980392157, blue: 0.4980392157, alpha: 1)))
                            .cornerRadius(30)
                    }
                }
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SeriesDetails: View {
    var series:Series?
    var body: some View {
        
        WhiteText(string: (series?.summary ?? "").removeTags)
            .lineLimit(nil)
        WhiteDivider()
        DetailsViewHStack(title: "Status", desc: series?.status ?? "")
        DetailsViewHStack(title: "Premiered Date", desc: series?.premiered?.dateToString ?? "")
        DetailsViewHStack(title: "Run Time", desc: "\(series?.runtime ?? 0) min")
        DetailsViewHStack(title: "Official Site", desc: series?.officialSite ?? "")
        DetailsViewHStack(title: "Url", desc: series?.seriesURL ?? "")
        DetailsViewHStack(title: "Rating", desc: "\(series?.rating?.average ?? 0)")
    }
    
}

struct DetailsViewHStack: View {
    var title: String
    var desc: String
    
    var body: some View {
        
        HStack(alignment:.top) {
            WhiteText(fontName: "ChalkboardSE-Bold", string:"\(title)")
                .frame(width: 125, alignment: .leading)
            WhiteText(string:": ")
            WhiteText(string: "\(desc)")
        }
    }
}

struct WhiteDivider: View {
    var height: CGFloat =  1.5
    var width: CGFloat = UIScreen.main.bounds.size.width - 40
    var body: some View {
        Divider()
            .frame(width: width , height: height , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color(.white))
    }
}

struct BlurredImageView: View {
    var image: String?
    var body: some View {
        WebImage(url: URL(string: (image ?? AppConstants.placeholderUrl)), isAnimating: .constant(true))
            .placeholder{Image("no-img")}
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .clipped()
            .ignoresSafeArea()
        VisualEffectView(effect: UIBlurEffect(style: .dark))
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct WhiteText: View {
    
    var fontName: String?
    var fontSize: CGFloat?
    var string: String
    var body: some View {
        Text(string)
            .foregroundColor(.white)
            .font(.custom(fontName ?? "ChalkboardSE-Regular", size: fontSize ?? 16))
            .lineLimit(nil)
    }
}

struct RoundCorneredRectangle: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .cornerRadius(3.0)
            .frame(width: (AppConstants.screenWidth - 20), height: 5, alignment: .top)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
