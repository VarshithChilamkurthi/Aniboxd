//
//  RecommendedAnimeViewModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 11/10/24.
//

import Foundation
import Combine

class RecommendedAnimeViewModel: ObservableObject {
    @Published var recommendedAnime: [RecommendedAnime] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetchPopularAnime(url: String) {
        APIManger.shared.getRecommendedAnime(url: url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished fetching recommended anime")
                case .failure:
                    print("Error fetching recommeded anime")
                }
            } receiveValue: { anime in
                self.recommendedAnime = anime.data ?? []
            }
            .store(in: &cancellables)
    }
}
