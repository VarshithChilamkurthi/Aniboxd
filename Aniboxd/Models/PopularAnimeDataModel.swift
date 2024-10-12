//
//  PopularAnimeDataModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 10/10/24.
//

import Foundation

struct PopularAnimeDataModel: Codable {
    let data: [Anime]?
}

struct Anime: Codable {
    let mal_id: Int?
    let url: String?
    let images: Images?
    let trailer: Trailer?
    let title: String?
    let title_english: String?
    let type: String?
    let episodes: Int?
    let status: String?
}

struct Images: Codable {
    let jpg: JPG?
}

struct JPG: Codable {
    let image_url: String?
    let small_image_url: String?
    let large_image_url: String?
}

struct Trailer: Codable {
    let youtube_id: String?
    let url: String?
    let embed_url: String?
    let images: JPG?
}
