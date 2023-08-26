//
//  LibraryView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI

struct LibraryView: View {
    
    @ObservedObject private var viewModel = LibraryViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Colors.primaryColor)]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("Search", text: $viewModel.searchText)
                    .padding()
                    .background(Colors.inputBackgroundColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                GeometryReader { geometry in
                    HStack(alignment: .center, spacing: 8) {
                        Button {
                            viewModel.category = .plant
                        } label: {
                            HStack {
                                Image(systemName: "leaf.fill")
                                Text("Plant")
                                    .font(.system(size: 12, weight: .medium))
                            }
                            .frame(maxWidth: geometry.size.width * 0.33)
                            .padding(.vertical, 8)
                            .foregroundColor(viewModel.category == .plant ? Colors.primaryColor : Colors.netral06)
                            .font(.system(size: 14, weight: .semibold))
                            .background(
                                viewModel.category == .plant ?
                                RoundedRectangle(
                                    cornerRadius: 8,
                                    style: .continuous
                                )
                                .stroke(Colors.primaryColor, lineWidth: 1)
                                : RoundedRectangle(
                                    cornerRadius: 8,
                                    style: .continuous
                                )
                                .stroke(Colors.netral02, lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                        
                        Button {
                            viewModel.category = .animal
                        } label: {
                            HStack {
                                Image(systemName: "fish.fill")
                                Text("Animal")
                                    .font(.system(size: 12, weight: .medium))
                            }
                            .frame(maxWidth: geometry.size.width * 0.33)
                            .padding(.vertical, 8)
                            .foregroundColor(viewModel.category == .animal ? Colors.primaryColor : Colors.netral06)
                            .font(.system(size: 14, weight: .semibold))
                            .background(
                                viewModel.category == .animal ?
                                RoundedRectangle(
                                    cornerRadius: 8,
                                    style: .continuous
                                )
                                .stroke(Colors.primaryColor, lineWidth: 1)
                                : RoundedRectangle(
                                    cornerRadius: 8,
                                    style: .continuous
                                )
                                .stroke(Colors.netral02, lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                        
                        Button {
                            viewModel.category = .hardscape
                        } label: {
                            HStack {
                                Image(systemName: "mountain.2.fill")
                                Text("Hardscape")
                                    .font(.system(size: 12, weight: .medium))
                            }
                            .frame(maxWidth: geometry.size.width * 0.33)
                            .padding(.vertical, 8)
                            .foregroundColor(viewModel.category == .hardscape ? Colors.primaryColor : Colors.netral06)
                            .font(.system(size: 14, weight: .semibold))
                            .background(
                                viewModel.category == .hardscape ?
                                RoundedRectangle(
                                    cornerRadius: 8,
                                    style: .continuous
                                )
                                .stroke(Colors.primaryColor, lineWidth: 1)
                                : RoundedRectangle(
                                    cornerRadius: 8,
                                    style: .continuous
                                )
                                .stroke(Colors.netral02, lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                
                if viewModel.category == .plant {
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: 14),
                            GridItem(.flexible(), spacing: 14)
                        ],
                        spacing: 14
                    ) {
                        ForEach(1..<2, id: \.self) { value in
                            NavigationLink(value: "Test") {
                                VStack {
                                    Image("ImagePlant")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 155, height: 140)
                                    
                                    Divider()
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Plant")
                                            .font(.caption)
                                            .foregroundColor(Colors.netral05)
                                        
                                        Text("Ceratopteris thalictroides")
                                            .font(.footnote)
                                            .foregroundColor(Colors.netral10)
                                            .fontWeight(.bold)
                                            .padding(.top, 4)
                                        
                                        Text("Ceratopteris thalictroides merupakan tumbuhan paku pantropis, tinggi 15-30 cm dan lebar 10-20 cm")
                                            .font(.caption)
                                            .foregroundColor(Colors.netral07)
                                            .padding(.top, 4)
                                    }
                                }
                                .padding(8)
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 8,
                                        style: .continuous
                                    )
                                    .stroke(Colors.netral02, lineWidth: 1)
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                         }
                     }
                    .padding(.top)
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.bottom)
                } else {
                    VStack(spacing: 14) {
                        Image(systemName: "xmark.bin")
                            .font(.largeTitle)
                            .foregroundColor(Colors.netral06)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Colors.netral02)
                            )
                        
                        Text("Tidak ada hasil")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .foregroundColor(Colors.netral10)
                        
                        Text("Tidak ditemukan artikel tentang yang anda inginkan, silahkan kurangi filter anda")
                            .font(.body)
                            .foregroundColor(Colors.netral08)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 56)
                }
                
                Spacer()
            }
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: String.self) { _ in
                DetailLibraryView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
