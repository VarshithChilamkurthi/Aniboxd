//
//  PopularAnimeViewModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 10/10/24.
//

import Foundation
import Combine

class PopularAnimeViewModel: ObservableObject {
    @Published var popularAnime: [Anime] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetchPopularAnime(url: String) {
        APIManger.shared.getData(url: url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished fetching popular anime")
                case .failure:
                    print("Error fetching popular anime")
                }
            } receiveValue: { popularAnime in
                self.popularAnime = popularAnime.data ?? []
            }
            .store(in: &cancellables)
    }
}
