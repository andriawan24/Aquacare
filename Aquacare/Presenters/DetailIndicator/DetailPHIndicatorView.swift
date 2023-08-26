//
//  DetailPHIndicator.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import Foundation
import SwiftUI

struct DetailPHIndicator: View {
    
    let phLevel: Int
    @Environment(\.dismiss) private var dismiss
    
    func getLevelText(ph: Int) -> String {
        if ph > 7 {
            return "PH Air Terlalu Tinggi"
        } else if ph < 7 {
            return "PH Air Terlalu Rendah"
        } else {
            return "PH Air Normal"
        }
    }
    
    func getLevelTextColor(ph: Int) -> Color {
        if ph > 7 {
            return Colors.dangerIndicator
        } else if ph < 7 {
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
                        Text("Ringkasan PH Air")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .center, spacing: 24) {
                        Text("\(phLevel)")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(getLevelText(ph:phLevel))
                            .font(.caption)
                            .foregroundColor(getLevelTextColor(ph: phLevel))
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
                            if phLevel > 6 {
                                Spacer()
                            }
                            
                            Rectangle()
                                .frame(width: 10, height: 20)
                                .padding(.horizontal, 70)
                            
                            if phLevel < 8 {
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
                
                if phLevel < 7 {
                    Text("PH air normal berkisar antara 6,5-7,5.\n\nMasalah ini dapat disebabkan oleh beberapa hal seperti:\n1. Bahan organik yang mati/membusuk (ikan, tanaman, atau kayu yang lapuk, atau sisa makanan)\n2. Konsentrasi karbon dioksida (CO2) yang terlarut dalam air tinggi.\n3. Suhu: Ketika suhu permukaan air naik, maka kelarutan karbon dioksida akan menurun sehingga pH akan turun dan air bersifat asam. keytika suhu turun karbondioksida akan naik dan ph akan naik dan bersifat basa.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                } else if phLevel > 7 {
                    Text("PH air normal berkisar antara 6,5-7,5.\n\nMasalah ini dapat disebabkan oleh beberapa hal seperti:\n1. Sumber Air yang memang basa\n2. Aktivitas alga: Penyebab kedua paling umum adalah banyak tanaman atau aktivitas alga di dalam akuarium..\n3. Substrat yang melepas kation ke dalam air Anda dan menaikkan pH air")
                        .padding(.horizontal)
                        .padding(.top, 2)
                } else {
                    Text("PH air normal berkisar antara 6,5-7,5. PH Air Aquarium anda dalam keadaan yang baik.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                }
                
                Text(phLevel == 7 ? "Cara Mempertahankan" : "Cara Penanganan")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top)
                
                if phLevel < 7 {
                    Text("Masalah ini dapat diatasi dengan beberapa cara:\n1. Pastikan tidak ada tanaman atau ikan yang mati di aquarium. apabila ada segera angkat.\n2. Pastikan filter aquarium berjalan dengan baik.\n3. Mengganti air Aquarium sebanyak 20-30%.\n4. Mencampur air akuarium dengan air RO.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                        .padding(.bottom)
                } else if phLevel > 7 {
                    Text("Masalah ini dapat diatasi dengan beberapa cara:\n1. Pastikan tidak ada tanaman atau ikan yang mati di aquarium. apabila ada segera angkat.\n2. Pastikan filter aquarium berjalan dengan baik.\n3. Mengganti air Aquarium sebanyak 20-30%.\n4. Mencampur air akuarium dengan air RO.")
                        .padding(.horizontal)
                        .padding(.top, 2)
                        .padding(.bottom)
                } else {
                    Text("Parameter PH yang baik dapat dijaga dengan beberapa cara:\n1. Pastikan tidak ada tanaman atau ikan yang mati di aquarium. apabila ada segera angkat.\n2. Pastikan filter aquarium berjalan dengan baik.\n3. Mengganti air Aquarium sebanyak 20-30%.\n4. Mencampur air akuarium dengan air RO.")
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
                        
                        Text("PH Air")
                            .fontWeight(.semibold)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct DetailPHIndicator_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailPHIndicator(phLevel: 9)
        }
    }
}
