//
//  LightSettingsView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import SwiftUI

struct LightSettingsView: View {
    @ObservedObject private var viewModel = LightViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("ImageIOTDevices")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .padding()
                .background(Colors.netral01)
                .cornerRadius(8)
                .padding()
            }
            
            HStack {
                Text("Lampu 101")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Image(systemName: "pencil.line")
                
                Spacer()
            }
            .padding(.horizontal)
            
            VStack(spacing: 14) {
                HStack {
                    Text("Kecerahan")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Spacer()
                }
                
                HStack {
                    Text("Daya")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        viewModel.updateLamp(
                            state: !viewModel.state, intensity: viewModel.intensity, startTime: viewModel.startTime, endTime: viewModel.endTime, scheduled: viewModel.scheduled
                        )
                    } label: {
                        Image(systemName: viewModel.state ? "power.circle.fill" : "power.circle")
                            .foregroundColor(Colors.primaryColor)
                            .font(.system(size: 32))
                    }
                    .buttonStyle(.plain)
                }
                
                Divider()
                
                Text("\(String(format: "%.0f", viewModel.intensity))")
                
                Slider(
                    value: $viewModel.intensity,
                    in: 0...10,
                    step: 1
                ) {
                    Text("Test")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("10")
                } onEditingChanged: { isEditing in
                    if !isEditing {
                        viewModel.updateLamp(
                            state: viewModel.state, intensity: viewModel.intensity, startTime: viewModel.startTime, endTime: viewModel.endTime,
                            scheduled: viewModel.scheduled
                        )
                    }
                }
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
            .padding(.horizontal)
            
            VStack(spacing: 14) {
                HStack {
                    Text("Jadwal On/Off Otomatis")
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Spacer()
                }
                
                HStack {
                    Text("Status")
                        .fontWeight(.semibold)
                    Spacer()
                    Toggle(isOn: $viewModel.scheduled) { }
                        .onChange(of: viewModel.scheduled) { scheduled in
                            viewModel.updateLamp(
                                state: viewModel.state, intensity: viewModel.intensity, startTime: viewModel.startTime, endTime: viewModel.endTime,
                                scheduled: viewModel.scheduled
                            )
                        }
                }
                
                Divider()
                
                HStack {
                    Text("Jadwal On")
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("9:00 AM")
                    }
                    .buttonStyle(.bordered)
                }
                
                Divider()
                
                HStack {
                    Text("Jadwal Off")
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("9:00 AM")
                    }
                    .buttonStyle(.bordered)
                }
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
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationTitle("Pengaturan Lampu")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(systemName: "chevron.left")
                        .fontWeight(.semibold)
                }
                .tint(Colors.primaryColor)
            }
        }
    }
}

struct LightSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LightSettingsView()
        }
    }
}
