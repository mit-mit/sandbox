//
//  ContentView.swift
//  housecirclecard
//
//  Created by Michael Thomsen on 12/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 235/255, green: 236/255, blue: 241/255)
            Image(systemName: "house")
                .foregroundColor(.white)
                .padding(10)
                .background(Color(red: 122/255, green: 193/255, blue: 231/255), in: Circle())
                .padding(15)
                .background(Color(red: 232/255, green: 242/255, blue: 247/255), in: Circle())
                .padding(15)
                .background(alignment: .center) {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .foregroundColor(.white)
                        .shadow(radius: 3, x: 3, y: 3)
                }
        }
    }
}

#Preview {
    ContentView()
}
