//
//  PopularAnimeView.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 10/10/24.
//

import SwiftUI

struct PopularAnimeView: View {
    @StateObject private var viewModel = PopularAnimeViewModel()
    
    let columns = [GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        VStack {
            ScrollView() {
                // MARK: - Title Section
                HStack {
                    Text("Popular Anime this week")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                // MARK: - Anime grid section
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.popularAnime, id: \.mal_id) { anime in
                        AsyncImage(url: URL(string: anime.images?.jpg?.image_url ?? "")) { image in
                            image
                                .resizable()
                                .frame(height: 180)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                                .frame(height: 180)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchPopularAnime(url: "https://api.jikan.moe/v4/seasons/now?sfw")
            }
        }
    }
}

#Preview {
    PopularAnimeView()
}
