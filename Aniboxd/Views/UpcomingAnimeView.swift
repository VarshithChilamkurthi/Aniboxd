//
//  UpcomingAnimeView.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 12/10/24.
//

import SwiftUI

struct UpcomingAnimeView: View {
    @StateObject private var viewModel = UpcomingAnimeViewModel()
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    // MARK: - Title section
                    HStack {
                        Text("Upcoming Anime")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    // MARK: - Reviews grid section
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.upcomingAnime, id: \.mal_id) { anime in
                            //todo: change this to UpcomingAnimeDetailView()
                            NavigationLink(destination: ContentView()) {
                                VStack {
                                    // MARK: - Title section
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(anime.title_english ?? "N/A")
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                            HStack {
                                                Text(anime.type ?? "N/A")
                                                    .font(.footnote)
                                            }
                                        }
                                        Spacer()
                                        
                                    }
                                    // MARK: - Video Section
                                    HStack(alignment: .top) {
                                        AsyncImage(url: URL(string: anime.images?.jpg?.image_url ?? "")) { image in
                                            image
                                                .resizable()
                                                .frame(width: 100, height: 140)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .padding(.top, 5)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                }
                            }
                            .foregroundStyle(Color.black)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchPopularAnime(url: "https://api.jikan.moe/v4/seasons/upcoming")
            }
        }
    }
}

#Preview {
    UpcomingAnimeView()
}
