//
//  ProjectForm2View.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI

struct ProjectForm2View: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: FormViewModel
    
    var pageIndicator: some View {
        NavigationStack {
            HStack {
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.netral02)
                
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.primaryColor)
                
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.netral02)
                
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.netral02)
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
    
    func plantItem(imageName: String, name: String, isSelected: Bool, onSelected: @escaping () -> Void) -> some View {
        ZStack {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(name)
                        .font(.footnote)
                        .foregroundColor(Colors.netral10)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                }
            }
            
            VStack {
                HStack {
                    Button {
                        onSelected()
                    } label: {
                        HStack {
                            Image(systemName: isSelected ? "checkmark.square" : "square")
                                .foregroundColor(Colors.netral06)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                
                Spacer()
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
        
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    pageIndicator
                    
                    HStack {
                        Text("Pilih Tanaman")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    TextField(
                        text: $viewModel.searchPlantText, label: {
                            Text("Cari...")
                                .foregroundColor(Colors.netral05)
                        }
                    )
                    .keyboardType(.numberPad)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Colors.inputBackgroundColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: 14),
                            GridItem(.flexible(), spacing: 14),
                            GridItem(.flexible(), spacing: 14)
                        ],
                        spacing: 14
                    ) {
                        ForEach(PlantModel.getPlants(), id: \.id) { plant in
                            plantItem(
                                imageName: plant.imageURL,
                                name: plant.name,
                                isSelected: viewModel.chosenPlants.contains(where: { $0.id == plant.id  }),
                                onSelected: {
                                    if let index = viewModel.chosenPlants.firstIndex(of: plant) {
                                        viewModel.chosenPlants.remove(at: index)
                                    } else {
                                        viewModel.chosenPlants.append(plant)
                                    }
                                }
                            )
                        }
                     }
                    .padding(.top)
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.bottom, 64)
                }
            }
            
            VStack {
                Spacer()
                
                NavigationLink {
                    ProjectForm3View()
                        .environmentObject(viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Selanjutnya")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.borderedProminent)
                .tint(Colors.primaryColor)
                .disabled(viewModel.chosenPlants.isEmpty)
                .padding(.horizontal)
                .padding(.top)
            }
        }
        .navigationTitle("Identifikasi Aquascape")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(systemName: "chevron.left")
                        .fontWeight(.semibold)
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(Colors.primaryColor)
            }
        }
    }
}

struct ProjectForm2View_Previews: PreviewProvider {
    static var previews: some View {
        ProjectForm2View()
    }
}
