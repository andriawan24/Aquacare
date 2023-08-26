//
//  DetailMyAquascape.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import SwiftUI

struct DetailMyAquascape: View {
    
    @State private var selectionMenu: MenuTypes = .insight
    @State private var showDialogMaintenance: Bool = false
    @Environment(\.dismiss) private var dismiss
    var project: Projects?
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ZStack {
                        Image("ImageTankDefault")
                            .resizable()
                            .scaledToFit()
                        
                        Image("photo.badge.plus")
                            .tint(Colors.primaryColor)
                    }
                    .onTapGesture {
                        showDialogMaintenance = true
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(
                        cornerRadius: 18,
                        style: .continuous
                    )
                    .stroke(Colors.netral02, lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 18).fill(Colors.netral01))
                )
                .padding()
                
                HStack(alignment: .center) {
                    Text(project?.name ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.netral10)
                    
                    Spacer()
                    
                    Text("Ditambahkan: \((project?.added ?? Date()).customFormat(format: "dd/MM/yyyy"))")
                        .font(.caption)
                        .foregroundColor(Colors.netral07)
                }
                .padding(.horizontal)
                
                HStack(spacing: 14) {
                    Text("Tank Insight")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(selectionMenu == .insight ? Colors.primaryColor : Color.black.opacity(0.25))
                        .onTapGesture {
                            selectionMenu = .insight
                        }
                    
                    Text("IOT Device")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(selectionMenu == .iot ? Colors.primaryColor : Color.black.opacity(0.25))
                        .onTapGesture {
                            selectionMenu = .iot
                        }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                if selectionMenu == .insight {
                    tankInsight
                } else {
                    devices
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            if selectionMenu == .insight {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showDialogMaintenance = true
                    } label: {
                        Text("Edit Info")
                            .fontWeight(.semibold)
                    }
                    .tint(Colors.primaryColor)
                }
            } else {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showDialogMaintenance = true
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Device")
                                .fontWeight(.semibold)
                        }
                    }
                    .tint(Colors.primaryColor)
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .tint(Color.black)
            }
        }
        .confirmationDialog("Menu Sedang Dalam Pengembangan", isPresented: $showDialogMaintenance) {
            Button {
                showDialogMaintenance = false
            } label: {
                Text("Saya Mengerti")
            }
        } message: {
            Text("Oops, menu sedang dalam pengembangan")
        }
    }
    
    func indicator(title: String, value: String, condition: Condition, conditionString: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                
                Text(value)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 4)
                
                Text(conditionString)
                    .foregroundColor(
                        condition == .normal ? Colors.successIndicator : condition == .danger ? Colors.dangerIndicator : Colors.warningIndicator
                    )
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Colors.netral10)
        }
        .padding()
        .background(
            RoundedRectangle(
                cornerRadius: 8,
                style: .continuous
            )
            .stroke(Colors.netral02, lineWidth: 1)
        )
        .background(.gray.opacity(0.005))
        .padding(.horizontal)
        .padding(.top)
    }
    
    var tankInsight: some View {
        VStack {
            HStack(spacing: 14) {
                VStack {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Colors.warningIndicator)
                        .padding(.top, 4)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Detektor air tidak terhubung")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundColor(Colors.netral10)
                    
                    
                    Text("Anda dapat memperbarui tangki Anda secara manual dengan tombol perbarui")
                        .foregroundColor(Colors.netral06)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                }
                
                NavigationLink {
                    InputLitmusView(projectID: project?.objectID)
                        .environmentObject(FormViewModel(id: project?.objectID))
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Perbarui")
                        .fontWeight(.semibold)
                        .font(.caption)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Colors.primaryColor, lineWidth: 1)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Colors.primaryColor.opacity(0.15)))
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                )
                .stroke(Colors.netral02, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 18).fill(Colors.netral01))
            )
            .padding(.horizontal, 12)
            
            NavigationLink {
                DetailPHIndicator(phLevel: Int(project?.levelPH ?? 0))
                    .navigationBarBackButtonHidden()
            } label: {
                indicator(title: "PH Air", value: "\(project?.levelPH ?? 0)", condition: project?.levelPH ?? 0 > 7 ? .danger : project?.levelPH ?? 0 < 7 ? .danger : .normal, conditionString: project?.levelPH ?? 0 > 7 ? "Terlalu Tinggi" : project?.levelPH ?? 0 < 7 ? "Terlalu Rendah" : "Normal")
            }
            .buttonStyle(.plain)
            
            NavigationLink {
                DetailKHIndicatorView(khLevel: Int(project?.levelKH ?? 0))
                    .navigationBarBackButtonHidden()
            } label: {
                indicator(title: "KH Air", value: "\(project?.levelKH ?? 0)", condition: project?.levelKH ?? 0 > 8 ? .danger : project?.levelKH ?? 0 < 4 ? .danger : .normal, conditionString: project?.levelKH ?? 0 > 8 ? "Terlalu Tinggi" : project?.levelKH ?? 0 < 4 ? "Terlalu Rendah" : "Normal")
            }
            .buttonStyle(.plain)
            
            NavigationLink {
                DetailGHIndicatorView(ghLevel: Int(project?.levelGH ?? 0))
                    .navigationBarBackButtonHidden()
            } label: {
                indicator(title: "GH Air", value: "\(project?.levelGH ?? 0)", condition: project?.levelGH ?? 0 > 7 ? .danger : project?.levelGH ?? 0 < 7 ? .danger : .normal, conditionString: project?.levelGH ?? 0 > 7 ? "Terlalu Tinggi" : project?.levelGH ?? 0 < 7 ? "Terlalu Rendah" : "Normal")
            }
            .buttonStyle(.plain)
            
            indicator(title: "Nitrit", value: "\(project?.levelNitrit ?? 0)", condition: project?.levelNitrit ?? 0 > 0 ? .danger : .normal, conditionString: project?.levelNitrit ?? 0 > 0 ? "Terlalu Tinggi" : "Normal")
            
            indicator(title: "Nitrat", value: "\(project?.levelNitrat ?? 0)", condition: project?.levelNitrat ?? 0 > 40 ? .danger : .normal, conditionString: project?.levelNitrat ?? 0 > 40 ? "Terlalu Tinggi" : "Normal")
        }
    }
    
    var devices: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: 14),
                GridItem(.flexible(), spacing: 14)
            ],
            spacing: 14
        ) {
            ForEach(1..<2, id: \.self) { value in
                NavigationLink {
                    LightSettingsView()
                        .navigationBarBackButtonHidden()
                } label: {
                    VStack {
                        HStack {
                            Text("Lamp")
                                .font(.title2)
                                .foregroundColor(Colors.netral10)
                                .fontWeight(.bold)
                                .padding(.top, 4)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(Colors.primaryColor)
                            
                            Text("Online")
                                .foregroundColor(Colors.primaryColor)
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.top, 48)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 8,
                            style: .continuous
                        )
                        .stroke(Colors.netral02, lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Colors.netral01))
                    )
                }
                .buttonStyle(PlainButtonStyle())
             }
         }
        .padding(.horizontal)
    }
}

struct DetailMyAquascape_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailMyAquascape()
        }
    }
}

enum Condition: String {
    case normal = "Normal", warning = "Warning", danger = "Danger"
}

enum MenuTypes {
    case insight, iot
}
