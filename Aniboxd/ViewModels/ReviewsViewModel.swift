//
//  ReviewsViewModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 11/10/24.
//

import Foundation
import Combine

class ReviewsViewModel: ObservableObject {
    @Published var reviews: [ReviewsData] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetchPopularAnime(url: String) {
        APIManger.shared.getReviewData(url: url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished fetching reviews")
                case .failure:
                    print("Error fetching reviews")
                }
            } receiveValue: { reviews in
                self.reviews = reviews.data ?? []
            }
            .store(in: &cancellables)
    }
}
