//
//  InputLitmusView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI
import CoreData

struct InputLitmusView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var viewModel: FormViewModel
    var projectID: NSManagedObjectID? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    HStack {
                        Text("PH Air")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        TextField(
                            text: $viewModel.phLevel,
                            label: {
                                Text("Masukkan PH Air")
                                    .foregroundColor(Colors.netral05)
                            }
                        )
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Colors.inputBackgroundColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                    
                Group {
                    HStack {
                        Text("KH Air")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        TextField(
                            text: $viewModel.khLevel, label: {
                                Text("Masukkan KH Air \(viewModel.khLevel)")
                                    .foregroundColor(Colors.netral05)
                            }
                        )
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Colors.inputBackgroundColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                Group {
                    HStack {
                        Text("GH Air")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        TextField(
                            text: $viewModel.ghLevel, label: {
                                Text("Masukkan GH Air")
                                    .foregroundColor(Colors.netral05)
                            }
                        )
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Colors.inputBackgroundColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                Group {
                    HStack {
                        Text("Nitrit Air")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        TextField(
                            text: $viewModel.nitritLevel, label: {
                                Text("Masukkan Nitrit Air")
                                    .foregroundColor(Colors.netral05)
                            }
                        )
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Colors.inputBackgroundColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                Group {
                    HStack {
                        Text("Nitrat Air")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        TextField(
                            text: $viewModel.nitratLevel, label: {
                                Text("Masukkan Nitrat Air")
                                    .foregroundColor(Colors.netral05)
                            }
                        )
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled()
                    }
                    .padding()
                    .background(Colors.inputBackgroundColor)
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                Spacer()
                
                Button {
                    if projectID == nil {
                        viewModel.save()
                    } else {
                        viewModel.updateProject(id: projectID!)
                    }
                } label: {
                    Text("Lihat Hasil")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .background(
                    NavigationLink(
                        destination: DetailMyAquascape(project: viewModel.result)
                            .environmentObject(viewModel)
                            .navigationBarBackButtonHidden(),
                        isActive: $viewModel.goToDetail
                    ) {
                        EmptyView()
                    }
                )
                .buttonStyle(.borderedProminent)
                .tint(Colors.primaryColor)
                .padding(.horizontal)
                .disabled(viewModel.phLevel.isEmpty || viewModel.khLevel.isEmpty || viewModel.ghLevel.isEmpty || viewModel.nitritLevel.isEmpty || viewModel.nitratLevel.isEmpty)
                .padding(.top)
            }
        }
        .task {
            if let projectID = projectID {
                viewModel.getProject(id: projectID)
            }
        }
        .navigationTitle("Masukkan Hasil Litmus")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    presentationMode.wrappedValue.dismiss()
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

struct InputLitmusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            InputLitmusView()
        }
    }
}
