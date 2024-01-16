//
//  BeerManager.swift
//  SESAC-BeerRecommender
//
//  Created by Seryun Chun on 2024/01/16.
//

import Foundation
import Alamofire

struct BeerManager {
    func callRequest(completionHandler: @escaping ([Beer]) -> Void) {
        let url = "https://api.punkapi.com/v2/beers"
        
        AF
            .request(url, method: .get)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
}
