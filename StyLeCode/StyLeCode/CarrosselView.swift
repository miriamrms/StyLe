//
//  CarrosselView.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 16/05/24.
//

import SwiftUI

struct CarrosselView: View {
    @State private var currentIndex = 0
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
//            let height = proxy.size.height
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 0){
                    ForEach(0..<14, id: \.self){ index in
                        GeometryReader{ itemProxy in
                            let itemFrame = itemProxy.frame(in: .global)
                            let scale = max(0.7, 1 - abs(itemFrame.midX - width / 2) / width)
                            let opacity = Double(scale)
                            
                            ZStack(alignment: .top){
                                VStack {
                                    
                                }
                                .frame(width: 280, height: 348)
                                .background(Color.secondarycolor)
                                .cornerRadius(20)
                                
                                ZStack {
                                    Circle()
                                        .fill(.secondarycolor)
                                        .stroke(.primarycolor, lineWidth: 2)
                                        .foregroundColor(.secondarycolor)
                                        .frame(width: 64, height: 64)
                                    Text("?")
                                        .foregroundColor(.primarycolor)
                                        .font(.custom("Poppins-Bold", size: 30))
                                }
                                .padding(-32)
                                

                                }
                                .frame(width: 280, height: 380)
                                .scaleEffect(scale)
                                .opacity(opacity)
                                
                            
                        }
                        . frame(width: 280, height: 444)
                        
                        
                    }
                }
                .padding(.horizontal, (width - (width * 0.7)) / 2)
                
            }
            
        }
        .frame(height: 380)
    }
}

#Preview {
    CarrosselView()
}
