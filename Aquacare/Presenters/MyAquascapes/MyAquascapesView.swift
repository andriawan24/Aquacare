//
//  MyAquascapesPage.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI

struct MyAquascapesPage: View {
    
    @ObservedObject private var viewModel = MyAquascapesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.projects.isEmpty {
                    VStack(spacing: 14) {
                        Image("ImageProjectsEmpty")
                        
                        Text("Belum ada aquascape")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Tambahkan tank aquascape terlebih dahulu untuk memulai")
                            .font(.body)
                            .foregroundColor(Colors.netral08)
                            .multilineTextAlignment(.center)
                        
                        NavigationLink {
                            ProjectForm1View()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Tambah Tank")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 6)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Colors.primaryColor)
                        .padding(.horizontal)
                        .padding(.top)
                    }
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("My Aquascape")
                                .padding(.horizontal, 24)
                                .padding(.top, 24)
                            
                            ForEach(viewModel.projects) { project in
                                NavigationLink {
                                    DetailMyAquascape(project: project)
                                } label: {
                                    VStack(alignment: .leading, spacing: 12) {
                                        Image("ImageTankDefault")
                                        Text(project.name ?? "")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                            .foregroundColor(Colors.netral10)
                                        
                                        Text("Ditambahkan pada: \((project.added ?? Date()).customFormat(format: "dd MMM yyyy"))")
                                            .foregroundColor(Colors.netral06)
                                            .fontWeight(.semibold)
                                            .font(.system(size: 12))
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .stroke(Colors.netral02, lineWidth: 1)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(Colors.netral01))
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.initData()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Selamat datang di Aquacare,")
                            .foregroundColor(Colors.netral07)
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        Text("Aquascaper")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                
                if !viewModel.projects.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            ProjectForm1View()
                                .navigationBarBackButtonHidden()
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                Text("Tambah Akuarium")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MyAquascapesPage_Previews: PreviewProvider {
    static var previews: some View {
        MyAquascapesPage()
    }
}
