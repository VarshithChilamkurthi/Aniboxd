//
//  ReviewsView.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 11/10/24.
//

import SwiftUI

struct ReviewsView: View {
    @StateObject private var viewModel = ReviewsViewModel()
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    // MARK: - Title section
                    HStack {
                        Text("Popular Reviews")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    // MARK: - Reviews grid section
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.reviews, id: \.entry?.mal_id) { review in
                            //todo: change this to ReviewDetailView()
                            NavigationLink(destination: ContentView()) {
                                VStack {
                                    // MARK: - Title section
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(review.entry?.title ?? "")
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                            HStack {
                                                Text((review.date?.extractYear() ?? "") + ",")
                                                Text("Score: " + String(review.score ?? 0))
                                            }
                                        }
                                        Spacer()
                                        Text(review.user?.username ?? "")
                                            .lineLimit(1)
                                        AsyncImage(url: URL(string: review.user?.images?.jpg?.image_url ?? "")) { image in
                                            image
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .clipShape(.circle)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                    }
                                    // MARK: - Image and review section
                                    HStack(alignment: .top) {
                                        AsyncImage(url: URL(string: review.entry?.images?.jpg?.image_url ?? "")) { image in
                                            image
                                                .resizable()
                                                .frame(width: 100, height: 140)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .padding(.top, 5)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Text(review.review ?? "")
                                            .lineLimit(8)
                                    }
                                }
                            }
                            .foregroundStyle(Color.black)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchPopularAnime(url: "https://api.jikan.moe/v4/reviews/anime")
            }
        }
    }
}

#Preview {
    ReviewsView()
}


extension String {
    func extractYear() -> String? {
        let dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        if let date = dateFormatter.date(from: self) {
            let yearFormatter = DateFormatter()
            yearFormatter.dateFormat = "yyyy"
            return yearFormatter.string(from: date)
        }
        
        return nil
    }
}
