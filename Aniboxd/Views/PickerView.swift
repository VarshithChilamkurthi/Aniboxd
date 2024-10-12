//
//  PickerView.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 10/10/24.
//

import SwiftUI

struct PickerView: View {
    @State private var selectedSegment: Int = 0
    
    var body: some View {
        Picker("Select a movie", selection: $selectedSegment) {
            Text("Anime").tag(0)
            Text("Reviews").tag(1)
            Text("Recommended").tag(2)
            Text("Upcoming").tag(3)
        }
        .pickerStyle(.segmented)
        
        switch selectedSegment {
        case 0:
            PopularAnimeView()
        case 1:
            ReviewsView()
        case 2:
            RecommendedAnimeView()
        case 3:
            UpcomingAnimeView()
        default:
            PopularAnimeView()
        }
    }
}

#Preview {
    PickerView()
}
