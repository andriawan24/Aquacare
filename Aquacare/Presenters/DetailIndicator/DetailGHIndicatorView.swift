//
//  DetailGHIndicatorView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import SwiftUI

struct DetailGHIndicatorView: View {
    let ghLevel: Int
    @Environment(\.dismiss) private var dismiss
    
    func getLevelText(gh: Int) -> String {
        if gh > 8 {
            return "GH Air Terlalu Tinggi"
        } else if gh < 4 {
            return "GH Air Terlalu Rendah"
        } else {
            return "GH Air Normal"
        }
    }
    
    func getLevelTextColor(gh: Int) -> Color {
        if gh > 8 {
            return Colors.dangerIndicator
        } else if gh < 4 {
            return Colors.dangerIndicator
        } else {
            return Colors.successIndicator
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Ringkasan GH Air")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .center, spacing: 24) {
                        Text("\(ghLevel)")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(getLevelText(gh: ghLevel))
                            .font(.caption)
                            .foregroundColor(getLevelTextColor(gh: ghLevel))
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Colors.dangerIndicator, Colors.warningIndicator, Colors.successIndicator, Colors.warningIndicator, Colors.dangerIndicator],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(height: 10)
                        
                        HStack {
                            if ghLevel > 3 {
                                Spacer()
                            }
                            
                            Rectangle()
                                .frame(width: 10, height: 20)
                                .padding(.horizontal, 70)
                            
                            if ghLevel < 9 {
                                Spacer()
                            }
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
                .padding(.top)
                
                Text("Saran Perawatan")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Penyebab")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                if ghLevel < 4 {
                    Text("GH air normal berkisar antara 4,0-8,0. ")
                        .padding(.horizontal)
                        .padding(.top, 2)
                } else if ghLevel > 8 {
                    Text("GH air normal berkisar antara 4,0-8,0.\n\nMasalah ini dapat disebabkan oleh aquascaper menggunakan bahan yang mengandung kalsium tinggi untuk hardscape seperti batu karst yang belum matang.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                } else {
                    Text("GH air normal berkisar antara 4,0-8,0. GH Air Aquarium anda dalam keadaan yang baik.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                }
                
                Text(ghLevel > 3 && ghLevel < 9 ? "Cara Mempertahankan" : "Cara Penanganan")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                if ghLevel < 4 {
                    Text("Masalah ini dapat diatasi dengan cara:\n1. Memasukkan karang jahe secukupnya ke dalam filter air.\n2. Memasukkan dolomit ke dalam air.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                        .padding(.bottom)
                } else if ghLevel > 8 {
                    Text("Masalah ini dapat diatasi dengan beberaa cara:\n\n1. Mencampur air akuarium dengan air RO (air osmosis).\n2. Menggunakan pelembut air berbasis tukar ion. Namun, sebagian besar pelembut air rumah tangga menggunakan garam dan mungkin tidak sesuai untuk kebanyakan aquascape.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                        .padding(.bottom)
                } else {
                    Text("1. Melakukan pengujian GH air secara rutin.\n2. Melakukan pergantian air secara berkala, namun pastikan air yang ditambahkan memiliki GH yang sama dengan aquascape Anda.\n3. Jika Anda menambahkan suplemen untuk tanaman atau ikan, pastikan Anda tahu efeknya terhadap GH. Beberapa suplemen, terutama yang mengandung kalsium atau magnesium, bisa meningkatkan GH.\n4. Jika Anda memiliki ikan atau tanaman yang memiliki kebutuhan GH khusus, pertimbangkan kebutuhan mereka saat menyesuaikan GH. Beberapa ikan dan tanaman memerlukan air lunak, sementara yang lain memerlukan air keras.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                        .padding(.bottom)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Colors.primaryColor)
                            .fontWeight(.bold)
                        
                        Text("KH Air")
                            .fontWeight(.semibold)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct DetailGHIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGHIndicatorView(ghLevel: 2)
    }
}
