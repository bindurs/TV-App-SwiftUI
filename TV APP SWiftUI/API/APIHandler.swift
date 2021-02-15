//
//  APIHandler.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 16/02/21.
//

import SwiftUI
import Combine

class APIHandler: ObservableObject {
    
    @Published var loading = false
    @Published var serieses: [Series] = [Series]()
    @Published var seasons: [Season] = [Season]()
    @Published var episodes: [Episode] = []
    @Published var casts: [CastCrew] = []
    @Published var crews: [CastCrew] = []
    
    init() {
        serieses = [Series]()
        seasons = [Season]()
        episodes = []
        casts = []
        crews = []
    }
    
    func fetchData<T:Codable>(fromPath path: String, forParams params: [(String, String)], forApiType apiType: APIType, forMappingModel mappingModel: T.Type) {
        loading = true
        ApiMapper().callAPI(withPath: path, params: params, andMappingModel: mappingModel) { [weak self] (result) in
            switch(result) {
            case .success(let fetchedResult):
                DispatchQueue.main.async {
                    switch apiType {
                    case .listSeries:
                        self?.serieses = fetchedResult as? [Series] ?? [Series]()
                    case .listSearchSeries:
                        self?.serieses = (fetchedResult as? [SearchResult] ?? [SearchResult]()).compactMap({$0.series})
                    case .listseasons:
                        self?.seasons = fetchedResult as? [Season] ?? [Season]()
                    case .listEpisodes:
                        self?.episodes = fetchedResult as? [Episode] ?? [Episode]()
                    case .listCast:
                        self?.casts = fetchedResult as? [CastCrew] ?? [CastCrew]()
                    case .listCrew:
                        self?.crews = fetchedResult as? [CastCrew] ?? [CastCrew]()
                    }
                    self?.loading = false
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self?.loading = false
                }
                break
            }
        }
    }
}
