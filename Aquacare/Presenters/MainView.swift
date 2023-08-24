//
//  ContentView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                MyAquascapesPage()
                    .tabItem {
                        Image(systemName: "square.2.layers.3d.top.filled")
                        Text("My Aquascapes")
                    }
                
                LibraryView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Library")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }
            .tint(Color("PrimaryColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
