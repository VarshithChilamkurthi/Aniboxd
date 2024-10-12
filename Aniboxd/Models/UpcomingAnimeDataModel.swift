//
//  UpcomingAnimeDataModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 12/10/24.
//

import Foundation

struct UpcomingAnimeDataModel: Codable {
    let data: [UpcomingAnime]?
}

struct UpcomingAnime: Codable {
    let mal_id: Int?
    let images: Images?
    let trailer: Trailer?
    let title: String?
    let title_english: String?
    let type: String?
}
