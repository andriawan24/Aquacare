//
//  ProjectForm1View.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI

struct ProjectForm1View: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel: FormViewModel = FormViewModel()
    
    func aquascapeTankSize(
        title: String,
        subtitle: String,
        isActive: Bool
    ) -> some View {
        ZStack {
            HStack {
                Spacer()
                VStack(alignment: .trailing, spacing: 8) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(subtitle)
                }
                .foregroundColor(isActive ? Colors.primaryColor : .primary)
            }
            .padding()
            .background(isActive ? Colors.primaryColor.opacity(0.25) : Colors.netral02)
            .cornerRadius(15)
            .padding(.leading, 24)
            
            HStack {
                Image(isActive ? "ImageAquascapeTankActive" : "ImageAquascapeTankInactive")
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
    var tankNameInput: some View {
        VStack {
            HStack {
                Text("Nama Tank")
                    .font(.callout)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            HStack {
                TextField(
                    text: $viewModel.tankName,
                    label: {
                        Text("Nama Aquarium")
                            .foregroundColor(Colors.netral05)
                    }
                )
                .autocorrectionDisabled()
            }
            .padding()
            .background(Colors.inputBackgroundColor)
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
    
    var tankAgeInput: some View {
        VStack {
            HStack {
                Text("Masukkan Umur Tank")
                    .font(.callout)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            HStack {
                TextField(
                    text: $viewModel.tankAge,
                    label: {
                        Text("Umur Aquarium")
                            .foregroundColor(Colors.netral05)
                    }
                )
                .keyboardType(.numberPad)
                .autocorrectionDisabled()
                
                Text("Bulan")
                    .foregroundColor(Colors.netral10)
                    .fontWeight(.semibold)
            }
            .padding()
            .background(Colors.inputBackgroundColor)
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
    
    var tankSizeInput: some View {
        VStack {
            HStack {
                Text("Pilih Ukuran Tank")
                    .font(.callout)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            aquascapeTankSize(
                title: "Kecil",
                subtitle: "Panjang < 60 cm",
                isActive: viewModel.tankSize == .small
            )
            .onTapGesture {
                viewModel.tankSize = .small
            }
            
            aquascapeTankSize(
                title: "Sedang",
                subtitle: "Panjang < 120 cm",
                isActive: viewModel.tankSize == .medium
            )
            .onTapGesture {
                viewModel.tankSize = .medium
            }
            
            aquascapeTankSize(
                title: "Besar",
                subtitle: "Panjang > 120 cm",
                isActive: viewModel.tankSize == .large
            )
            .onTapGesture {
                viewModel.tankSize = .large
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Colors.primaryColor)
                    
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Colors.netral02)
                    
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Colors.netral02)
                    
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Colors.netral02)
                }
                .padding(.top)
                .padding(.horizontal)
                
                tankNameInput
                tankAgeInput
                tankSizeInput
                
                Spacer()
                
                NavigationLink {
                    ProjectForm2View()
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
                .disabled(viewModel.tankName.isEmpty || viewModel.tankAge.isEmpty)
                .padding(.horizontal)
                .padding(.top, 48)
            }
        }
        .navigationTitle("Identifikasi Aquascape")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
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

struct ProjectForm1View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProjectForm1View()
        }
    }
}
