//
//  ContentView.swift
//  Aniboxd
//
//  Created by Varshith Chilamkurthi on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Aniboxd")
                .font(.title)
                .fontWeight(.bold)
            
            PickerView()
            
            Spacer()
        }
        .padding()
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
