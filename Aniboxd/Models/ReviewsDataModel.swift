//
//  ReviewsDataModel.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 11/10/24.
//

import Foundation

struct ReviewsDataModel: Codable {
    let data: [ReviewsData]?
}

struct ReviewsData: Codable {
    let date: String?
    let review: String?
    let score: Int?
    let entry: Entry?
    let user: User?
}

struct Entry: Codable {
    let mal_id: Int?
    let images: Images?
    let title: String?
}

struct User: Codable {
    let username: String?
    let images: Images?
}
