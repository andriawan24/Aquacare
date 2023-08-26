//
//  ContentView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showOnboarding: Bool = false
    
    var body: some View {
        TabView {
            MyAquascapesPage()
//            ProjectForm4View()
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
        .onAppear {
            let notFirstTime = UserDefaults.standard.bool(forKey: "not_first_time")
            print("Not first time \(notFirstTime)")
            if !notFirstTime {
                showOnboarding = true
            }
        }
        .tint(Colors.primaryColor)
        .sheet(isPresented: $showOnboarding, onDismiss: {
            UserDefaults.standard.set(true, forKey: "not_first_time")
            showOnboarding = false
        }) {
            VStack {
                Text("What’s in\nAquasCare")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Colors.primaryColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 48)
                    .padding(.horizontal)
                
                HStack(spacing: 14) {
                    Image(systemName: "lightbulb.led.fill")
                        .frame(width: 48)
                        .font(.largeTitle)
                        .foregroundColor(Colors.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Action Suggestions")
                            .foregroundColor(Colors.primaryColor)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Aquarium condition update")
                            .foregroundColor(Colors.netral10)
                            .fontWeight(.light)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 48)
                
                HStack(spacing: 14) {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .frame(width: 48)
                        .font(.largeTitle)
                        .foregroundColor(Colors.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Measure with iOT")
                            .foregroundColor(Colors.primaryColor)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Real-time monitoring of aquarium conditions")
                            .foregroundColor(Colors.netral10)
                            .fontWeight(.light)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 24)
                
                HStack(spacing: 14) {
                    Image(systemName: "sparkles")
                        .frame(width: 48)
                        .font(.largeTitle)
                        .foregroundColor(Colors.primaryColor)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Beginner Friendly")
                            .foregroundColor(Colors.primaryColor)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Provides a library for aquarium maintenance")
                            .foregroundColor(Colors.netral10)
                            .fontWeight(.light)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 24)
                
                Spacer()
                
                Button {
                    UserDefaults.standard.set(true, forKey: "not_first_time")
                    showOnboarding = false
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
                .tint(Colors.primaryColor)
                .padding(.horizontal)
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
