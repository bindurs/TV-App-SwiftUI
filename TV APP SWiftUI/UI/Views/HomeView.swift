//
//  ContentView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 15/02/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchQuery: String = ""
    @ObservedObject var apiHandler = APIHandler()
    @State private var pageNumber = 1
    @State var twoGridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment:.top) {
                Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)).ignoresSafeArea()
                VStack(spacing:10) {
                    SearchBar(searchText: $searchQuery, onSearchButtonClicked: { (completed) in
                        self.searchQuery.count == 0 ? fetchSeries() : searchSeries()
                    })
                    
                    ScrollView {
                        ZStack {
                            LazyVGrid(columns: twoGridLayout, spacing: 5) {
                                ForEach(apiHandler.serieses) { series in
                                    SeriesCellView(series: series) .onAppear {
                                        
                                        if series.id == apiHandler.serieses.last?.id && searchQuery.count == 0  {
                                            pageNumber += 1
                                            fetchSeries()
                                        }
                                    }
                                }
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                ActivityIndicator(isAnimating: .constant(apiHandler.loading), style: .large)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150 , alignment: .center)
            } .onAppear {
                self.searchQuery.count == 0 ? fetchSeries() : searchSeries()
            }
            .navigationBarTitle("SHOWS", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
                nc.navigationBar.titleTextAttributes = [
                    .foregroundColor : UIColor.white,
                    .font: UIFont(name: "ChalkboardSE-Regular", size: 25) ?? UIFont.boldSystemFont(ofSize: 25)
                ]
            })
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
    func fetchSeries() {
        let params = [
            ("page", String(pageNumber))
        ]
        apiHandler.fetchData(fromPath: ApiUrls.show, forParams: params, forApiType: .listSeries, forMappingModel: [Series].self)
    }
    
    func searchSeries() {
        let params = [
            ("q", searchQuery)
        ]
        pageNumber = 1
        apiHandler.fetchData(fromPath: ApiUrls.search, forParams: params, forApiType: .listSearchSeries, forMappingModel: [SearchResult].self)
    }
    
}
struct NavTitle: View {
    
    var title: String
    var body: some View {
        HStack {
            Text(title).foregroundColor(.white)
        }.frame(width: UIScreen.main.bounds.size.width, height: 65, alignment: .top).font(.custom("ChalkboardSE-Regular", size: 25))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

