//
//  ProjectForm3View.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI

struct ProjectForm3View: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: FormViewModel
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.netral02)
                
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.netral02)
                
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.primaryColor)
                
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.netral02)
            }
            .padding(.top)
            .padding(.horizontal)
            
            HStack {
                Text("Enter Total Fish in Aquarium")
                    .font(.callout)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            HStack {
                TextField(
                    text: $viewModel.totalFish, label: {
                        Text("Jumlah Ikan")
                            .foregroundColor(Colors.netral05)
                            .font(.callout)
                    }
                )
                .keyboardType(.numberPad)
                .autocorrectionDisabled()
                
                Text("Ekor")
                    .foregroundColor(Colors.netral10)
                    .fontWeight(.semibold)
                    .font(.callout)
            }
            .padding()
            .background(Colors.inputBackgroundColor)
            .cornerRadius(8)
            .padding(.horizontal)
            
            Spacer()
            
            NavigationLink {
                ProjectForm4View()
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
            .disabled(viewModel.totalFish.isEmpty)
            .padding(.horizontal)
            .padding(.top)
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

struct ProjectForm3View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProjectForm3View()
        }
    }
}
