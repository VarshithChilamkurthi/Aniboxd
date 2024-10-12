//
//  RecommendedAnimeView.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 11/10/24.
//

import SwiftUI

struct RecommendedAnimeView: View {
    @StateObject private var viewModel = RecommendedAnimeViewModel()
    
    let columns = [GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10),
                   GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        VStack {
            ScrollView() {
                // MARK: - Title Section
                HStack {
                    Text("Recommended Anime")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                // MARK: - Anime grid section
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.recommendedAnime, id: \.mal_id) { anime in
                        ForEach(anime.entry ?? [], id: \.mal_id) { entry in
                            AsyncImage(url: URL(string: entry.images?.jpg?.image_url ?? "")) { image in
                                image
                                    .resizable()
                                    .frame(height: 180)
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 180)
                            }
                            
                            // MARK: - not working
                            
                            //                            AsyncImage(url: URL(string: entry.images?.jpg?.image_url ?? "")) { phase in
                            //                                switch phase {
                            //                                case .empty:
                            //                                    ProgressView()
                            //                                        .frame(height: 180)
                            //                                case .success(let image):
                            //                                    image
                            //                                        .resizable()
                            //                                        .frame(height: 180)
                            //                                        .scaledToFit()
                            //                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                            //                                case .failure:
                            //                                    Image(systemName: "photo.fill")
                            //                                        .resizable()
                            //                                        .frame(height: 180)
                            //                                        .scaledToFit()
                            //                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                            //                                @unknown default:
                            //                                    EmptyView()
                            //                                }
                            //                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchPopularAnime(url: "https://api.jikan.moe/v4/recommendations/anime")
            }
        }
    }
}

#Preview {
    RecommendedAnimeView()
}
