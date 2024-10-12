//
//  APIManger.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 10/10/24.
//

import Foundation
import Combine

class APIManger {
    static let shared = APIManger()
    private init() {}
    
    func getData(url: String) -> AnyPublisher<PopularAnimeDataModel, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                return result.data
            }
            .decode(type: PopularAnimeDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getReviewData(url: String) -> AnyPublisher<ReviewsDataModel, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                return result.data
            }
            .decode(type: ReviewsDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getRecommendedAnime(url: String) -> AnyPublisher<RecommendedAnimeDataModel, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                return result.data
            }
            .decode(type: RecommendedAnimeDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getUpcomingAnime(url: String) -> AnyPublisher<UpcomingAnimeDataModel, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                return result.data
            }
            .decode(type: UpcomingAnimeDataModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
