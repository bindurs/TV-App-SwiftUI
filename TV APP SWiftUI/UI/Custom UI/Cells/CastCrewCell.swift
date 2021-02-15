//
//  CastCrewCell.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 19/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CastCrewCell: View {
    
    var isCast:Bool
    var castCrews: [CastCrew]
    var body: some View {
        
        VStack {
            ForEach (castCrews) { castCrew in
                ZStack(alignment: .topLeading) {
                    VisualEffectView(effect: UIBlurEffect(style: .light))
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5) {
                        WebImage(url: URL(string: (castCrew.person?.image?.original ?? AppConstants.placeholderUrl)), isAnimating: .constant(true))
                            .placeholder{Image("no-img")}
                            .resizable()
                            .scaledToFill()
                            .frame(width: 65, alignment: .top)
                            .clipShape(Circle())
                        VStack(alignment:.leading) {
                            WhiteText(string:"Name: \(castCrew.person?.name ?? "test")")
                            if isCast {
                                WhiteText(string:"Role: \(castCrew.character?.name ?? "test")")
                            } else {
                                WhiteText(string:"Type: \(castCrew.type ?? "test")")
                            }
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        if isCast {
                            WebImage(url: URL(string: (castCrew.character?.image?.original ?? AppConstants.placeholderUrl)), isAnimating: .constant(true))
                                .placeholder{Image("no-img")}
                                .resizable()
                                .scaledToFill()
                                .frame(width: 65, alignment: .top)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .cornerRadius(5)
                .clipped()
                
            }
        }
    }
}
