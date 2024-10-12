//
//  UpcomingAnimeViewModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 12/10/24.
//

import Foundation
import Combine

class UpcomingAnimeViewModel: ObservableObject {
    @Published var upcomingAnime: [UpcomingAnime] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetchPopularAnime(url: String) {
        APIManger.shared.getUpcomingAnime(url: url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished fetching upcoming anime")
                case .failure:
                    print("Error fetching upcoming anime")
                }
            } receiveValue: { upcomingAnime in
                self.upcomingAnime = upcomingAnime.data ?? []
            }
            .store(in: &cancellables)
    }
}
