//
//  APIMapper.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 16/02/21.
//

import Foundation

import UIKit

class ApiMapper {
    
    //MARK: Shared Instance
    
    static let sharedInstance : ApiMapper = {
        let instance = ApiMapper()
        return instance
    }()
    
    
    init() {
    }
    
    //MARK: Api Calls
    
    func callAPI<T: Codable>(withPath pathString: String, params : [(String, String)], andMappingModel model: T.Type, callback: @escaping (_ result: Result<T, Error>) -> Void ) {
        
        let url = self.generateURL(withPath: pathString , andParams: params)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(model, from: data!)
                callback(Result.success(responseModel))
            } catch {
                callback(Result.failure(error))
            }
        }
        task.resume()
    }
    
    //MARK: helper methods
    
    func generateURL(withPath path: String, andParams params: [(String, String)]) -> URL {
        
        var urlComp = URLComponents(string: ApiUrls.baseUrl)!
        var urlQueryItems = [URLQueryItem]()
        for param in params {
            urlQueryItems.append(URLQueryItem(name: param.0, value: param.1))
        }
        if urlQueryItems.count != 0 {
            urlComp.queryItems = urlQueryItems
        }
        var url = urlComp.url!
        url = url.appendingPathComponent(path)
        print(url)
        return url
    }
}
