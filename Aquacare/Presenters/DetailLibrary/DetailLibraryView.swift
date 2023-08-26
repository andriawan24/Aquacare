//
//  DetailLibraryView.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import SwiftUI

struct DetailLibraryView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    
    var shortDescription: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Plant")
                .font(.subheadline)
                .foregroundColor(Colors.netral05)
            
            Text("Ceratopteris thalictroides")
                .font(.title2)
                .foregroundColor(Colors.netral10)
                .fontWeight(.bold)
            
            Text("Ceratopteris thalictroides merupakan tumbuhan paku pantropis, tinggi 15-30 cm dan lebar 10-20 cm")
                .font(.body)
                .foregroundColor(Colors.netral07)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(
            RoundedRectangle(
                cornerRadius: 18,
                style: .continuous
            )
            .fill(.background)
            .shadow(
                color: .gray.opacity(0.2),
                radius: 3,
                x: 0, y: -4
            )
        )
    }
    
    func statistic(width: Double) -> some View {
        HStack {
            HStack(spacing: 2) {
                VStack(alignment: .leading, spacing: 14) {
                    HStack(alignment: .center) {
                        Image(systemName: "tree.fill")
                            .frame(height: 18)
                        Text("Growth Rate")
                            .font(.caption)
                    }
                    .foregroundColor(Colors.netral06)
                    
                    Text("Tinggi")
                        .foregroundColor(Colors.netral10)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: width * 0.33)
                
                VStack(alignment: .leading, spacing: 14) {
                    HStack(alignment: .center) {
                        Image(systemName: "light.overhead.left.fill")
                            .frame(height: 18)
                        
                        Text("Light")
                            .font(.caption)
                    }
                    .foregroundColor(Colors.netral06)
                    
                    Text("Rendah")
                        .foregroundColor(Colors.netral10)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: width * 0.33)
                
                VStack(alignment: .leading, spacing: 14) {
                    HStack(alignment: .center) {
                        Image(systemName: "bubbles.and.sparkles.fill")
                            .frame(height: 18)
                        
                        Text("CO2 Level")
                            .font(.caption)
                    }
                    .foregroundColor(Colors.netral06)
                    
                    Text("Rendah")
                        .foregroundColor(Colors.netral10)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: width * 0.33)
            }
        }
        .padding()
        .background(Colors.netral01)
        .cornerRadius(8)
        .padding(.horizontal)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    ZStack(alignment: .topLeading) {
                        Image("ImagePlant")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 330)
                        
                        Button {
                            dismiss.callAsFunction()
                        } label: {
                            Circle()
                                .foregroundColor(Colors.buttonBackground)
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "chevron.backward")
                                }
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    shortDescription
                    statistic(width: geometry.size.width)
                    section(title: "Informasi Umum", description: "Tumbuh dengan cepat, yang membantu mencegah pertumbuhan alga. Juga cocok sebagai tanaman terapung Tanaman ini biasanya tumbuh dengan cepat, namun penambahan CO2 mungkin diperlukan untuk mendorong pertumbuhan. Di akuarium kecil dan terbuka, ia dapat tumbuh keluar dari akuarium dan membentuk permukaan daun yang indah. Daunnya yang bercabang halus sangat dekoratif dan memberikan kontras yang baik dengan bentuk daun lainnya. Dalam cahaya yang baik Ceratopteris thalictroides tumbuh dengan cepat dan membantu mencegah alga dengan mengonsumsi nutrisi dalam jumlah besar. Ini menjadikannya tanaman awal yang baik di akuarium kecil.")
                    section(title: "Substrat", description: "Tanaman ini tidak terlalu menuntut dalam hal substrat, namun substrat yang kaya nutrisi dapat mendorong pertumbuhan yang lebih sehat. Anda juga dapat menggunakan tab akar untuk memberikan nutrisi penting pada akar.")
                    section(title: "Pemupukan", description: "Meskipun tidak mutlak diperlukan, menyuntikkan CO2 dapat sangat meningkatkan pertumbuhan Ceratopteris thalictroides. Suplementasi karbon dioksida dapat meningkatkan warna cerah dan pertumbuhan lebih cepat. Jika Anda memilih untuk menambahkan CO2, pastikan seimbang dan tidak menyebabkan fluktuasi pH.")
                    section(title: "Penggantian Air", description: "Penggantian air secara teratur sekitar 20-30% setiap minggu akan membantu menjaga kualitas air dan menghilangkan kelebihan nutrisi yang dapat menyebabkan pertumbuhan alga.")
                    section(title: "Pemangkasan", description: "Ceratopteris thalictroides dapat tumbuh cukup cepat, jadi pemangkasan sesekali diperlukan untuk mencegah kepadatan dan naungan tanaman lain. Cukup pangkas daun tertua dan paling tidak sehat di bagian pangkalnya untuk mendorong pertumbuhan baru.")
                    section(title: "Penempatan", description: "Tanaman ini dapat digunakan sebagai tanaman background atau midground. Bisa juga dibiarkan mengapung di permukaan air, sehingga menciptakan efek alami dan menenangkan.")
                    
                    Button {
                        openURL.callAsFunction(URL(string: "https://www.google.com")!)
                    } label: {
                        HStack {
                            Text("Lihat Sumber Luar")
                            Image(systemName: "arrow.up.right")
                        }
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                    }
                    .buttonStyle(.bordered)
                    .tint(Colors.netral10)
                    .padding()
                }
            }
        }
    }
    
    func section(title: String, description: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .foregroundColor(Colors.netral10)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            Text(description)
            .padding(.horizontal)
            .padding(.top, 4)
        }
    }
}

struct DetailLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailLibraryView()
        }
    }
}
