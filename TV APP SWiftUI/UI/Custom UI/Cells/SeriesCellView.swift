//
//  SeriesCellView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 19/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SeriesCellView: View {
    
    @State var imageSize: CGSize = .zero
    var series: Series
    
    var body: some View {
        NavigationLink(destination:DetailsView(series: series)) {
            ZStack(alignment: .topTrailing) {
                VStack (alignment:.center, spacing: 10) {
                    WebImage(url: URL(string: (series.image?.original ?? AppConstants.placeholderUrl)), isAnimating: .constant(true))
                        .placeholder{Image("no-img")}
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: .infinity)
                        .clipped()
                    
                    Text(series.name ?? "")
                        .lineLimit(nil)
                        .foregroundColor(.white)
                        .font(.custom("ChalkboardSE-Regular", size: 20))
                        .padding(10)
                }
                ZStack  {
                    Image("star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                    Text(String.localizedStringWithFormat("%.1f", series.rating?.average ?? 0))
                        .font(.custom("ChalkboardSE-Regular", size: 12))
                }.offset(x: -10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }.background(Color(.black))
        }
    }
    func getCellSize() -> CGSize {
        let size = UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ?  UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width
        
        return CGSize(width: (size - 30)/2, height: size/2+50)
    }
}
