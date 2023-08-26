//
//  ProjectForm4View.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI

struct ProjectForm4View: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var showManualInstruction1 = false
    @State private var showManualInstruction2 = false
    @State private var goToInputLitmus = false
    @State private var navigationPath = NavigationPath()
    @EnvironmentObject private var viewModel: FormViewModel
    @State private var showDialogMaintenance: Bool = false
    
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
                    .foregroundColor(Colors.netral02)
                
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Colors.primaryColor)
            }
            .padding(.top)
            .padding(.horizontal)
            
            HStack {
                Text("Choose Measurement Method")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 8) {
                Image("ImageMeasurementManual")
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pengukuran Manual")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.netral10)
                    
                    Text("Bagi kamu yang belum memiliki alat pengukuran iOT AquaCare")
                        .font(.system(size: 14))
                        .foregroundColor(Colors.netral07)
                }
                Image(systemName: "chevron.right")
                    .foregroundColor(Colors.primaryColor)
                    .padding(.leading)
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
            .onTapGesture {
                showManualInstruction1 = true
            }
            .padding(.horizontal)
            .sheet(isPresented: $showManualInstruction1) {
                ManualInstruction1View(showNext: $goToInputLitmus, showManualInstruction1: $showManualInstruction1, showManualInstruction2: $showManualInstruction2)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showManualInstruction2) {
                ManualInstruction2View(showNext: $goToInputLitmus)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
            }
            
            HStack(spacing: 8) {
                Image("ImageMeasurementIOT")
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pengukuran Otomatis")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.netral10)
                    
                    Text("Bagi kamu yang memiliki alat pengukuran iOT AquaCare")
                        .font(.system(size: 14))
                        .foregroundColor(Colors.netral07)
                }
                Image(systemName: "chevron.right")
                    .foregroundColor(Colors.primaryColor)
                    .padding(.leading)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                )
                .stroke(Colors.netral02, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 8).fill(Colors.netral01))
            )
            .onTapGesture {
                showDialogMaintenance = true
            }
            .padding(.horizontal)
            .confirmationDialog("Menu Sedang Dalam Pengembangan", isPresented: $showDialogMaintenance) {
                Button {
                    showDialogMaintenance = false
                } label: {
                    Text("Saya Mengerti")
                }
            } message: {
                Text("Oops, menu sedang dalam pengembangan")
            }
            
            Spacer()
        }
        .navigationTitle("Identifikasi Aquascape")
        .navigationBarTitleDisplayMode(.inline)
        .background(
            NavigationLink(
                destination: InputLitmusView()
                    .environmentObject(viewModel),
                isActive: $goToInputLitmus
            ) {
                EmptyView()
            }
        )
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

struct ProjectForm4View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProjectForm4View()
        }
    }
}

struct ManualInstruction1View: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNext: Bool
    @Binding var showManualInstruction1: Bool
    @Binding var showManualInstruction2: Bool

    var body: some View {
        VStack(spacing: 14) {
            Image("ImageManualFill1")
            
            Text("Satu Langkah Sebelum Anda Memulai")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Colors.netral10)
                .fontWeight(.bold)
            
            Text("Sebelum mengambil langkah penting itu harap persiapkan Kertas Lakmus Anda. Jika menyangkut sesuatu yang penting seperti air Anda, keakuratan itu penting.")
                .foregroundColor(Colors.netral10)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .font(.system(size: 14))
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
                DispatchQueue.main.async {
                    showManualInstruction1 = false
                    showManualInstruction2 = true
                }
            } label: {
                Text("Selanjutnya")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.semibold)
                    .padding(.vertical, 6)
            }
            .buttonStyle(.borderedProminent)
            .tint(Colors.primaryColor)
            .padding(.horizontal)
            
            Button {
                presentationMode.wrappedValue.dismiss()
                DispatchQueue.main.async {
                    showNext = true
                }
            } label: {
                Text("Lewati")
                    .fontWeight(.semibold)
            }
            .foregroundColor(Colors.primaryColor)
        }
    }
}

struct ManualInstruction2View: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNext: Bool
    
    var body: some View {
        VStack(spacing: 14) {
            Image("ImageManualFill2")
            
            Text("Cara menggunakan Kertas Lakmus")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Colors.netral10)
                .fontWeight(.bold)
            
            Text("""
                1. Rendam kertas Pitmus ke dalam air aquascape Anda
                2. Keluarkan kertas lakmus Anda dan kibaskan
                3. Tunggu selama 1 menit, dan Anda dapat mencocokkan warna pada kertas lakmus dengan indikator pada kemasan lakmus
                4. Anda dapat mengisi hasilnya ke aplikasi kami untuk mengetahui apa yang terjadi dengan tangki Anda
            """)
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .font(.system(size: 14))
            .foregroundColor(Colors.netral10)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
                DispatchQueue.main.async {
                    showNext = true
                }
            } label: {
                Text("Selanjutnya")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.semibold)
                    .padding(.vertical, 6)
            }
            .buttonStyle(.borderedProminent)
            .tint(Colors.primaryColor)
            .padding(.horizontal)
            
            Button {
                presentationMode.wrappedValue.dismiss()
                DispatchQueue.main.async {
                    showNext = true
                }
            } label: {
                Text("Lewati")
                    .fontWeight(.semibold)
            }
            .foregroundColor(Colors.primaryColor)
        }
    }
}
