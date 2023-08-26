//
//  DetailKHIndicatorView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import SwiftUI

struct DetailKHIndicatorView: View {
    
    let khLevel: Int
    @Environment(\.dismiss) private var dismiss
    
    func getLevelText(kh: Int) -> String {
        if kh > 8 {
            return "KH Air Terlalu Tinggi"
        } else if kh < 4 {
            return "KH Air Terlalu Rendah"
        } else {
            return "KH Air Normal"
        }
    }
    
    func getLevelTextColor(kh: Int) -> Color {
        if kh > 8 {
            return Colors.dangerIndicator
        } else if kh < 4 {
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
                        Text("Ringkasan KH Air")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .center, spacing: 24) {
                        Text("\(khLevel)")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(getLevelText(kh: khLevel))
                            .font(.caption)
                            .foregroundColor(getLevelTextColor(kh: khLevel))
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
                            if khLevel > 3 {
                                Spacer()
                            }
                            
                            Rectangle()
                                .frame(width: 10, height: 20)
                                .padding(.horizontal, 70)
                            
                            if khLevel < 9 {
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
                
                if khLevel < 4 {
                    Text("KH air normal berkisar antara 4,0 - 8,0.\n\nMasalah ini dapat disebabkan oleh tingkat CO₂ yang terlalu berlebihan.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                } else if khLevel > 8 {
                    Text("KH air normal berkisar antara 4,0-8,0.\n\nMasalah ini dapat disebabkan oleh aquascaper menggunakan bahan yang mengandung kalsium tinggi untuk hardscape seperti batu karst yang belum matang.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                } else {
                    Text("KH air normal berkisar antara 4,0-8,0. KH Air Aquarium anda dalam keadaan yang baik.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                }
                
                Text(khLevel > 3 && khLevel < 9 ? "Cara Mempertahankan" : "Cara Penanganan")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                if khLevel < 4 {
                    Text("Masalah ini dapat diatasi dengan cara memasukkan Karang Jahe secukupnya ke dalam filter air.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                        .padding(.bottom)
                } else if khLevel > 8 {
                    Text("1. Melakukan pengujian KH secara rutin.\n2. Melakukan penggantian air parsial secara rutin (sekitar 20-25% setiap minggu atau dua minggu sekali) membantu mempertahankan kesadahan yang stabil dan menghilangkan polutan.\n3. Hindari Menggunakan CO₂ Berlebihan karena dapat menurunkan KH Anda. Pastikan untuk memonitor KH dan pH jika Anda menggunakan CO₂.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                        .padding(.bottom)
                } else {
                    Text("Masalah ini dapat diatasi dengan cara mencampur air akuarium dengan air RO (air osmosis).")
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

struct DetailKHIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailKHIndicatorView(khLevel: 2)
    }
}
