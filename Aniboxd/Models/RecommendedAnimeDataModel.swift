//
//  RecommendedAnimeDataModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 11/10/24.
//

import Foundation

struct RecommendedAnimeDataModel: Codable {
    let data: [RecommendedAnime]?
}

struct RecommendedAnime: Codable {
    let mal_id: String?
    let entry: [Entry]?
}
