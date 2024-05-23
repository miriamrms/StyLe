//
//  CarrosselView.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 16/05/24.
//

import SwiftUI

struct CarrosselView: View {
    @State private var currentIndex = 0
    @Binding var buttonValues: [Int]
    //  [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
    var teste: Bool = true
    
    
//    let iconVec: [Image] = iconVector
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
//            let height = proxy.size.height
            
            ScrollViewReader { value in
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        ForEach(0..<14, id: \.self){ index in
                            
                            GeometryReader{ itemProxy in
                                let itemFrame = itemProxy.frame(in: .global)
                                let scale = max(0.7, 1 - abs(itemFrame.midX - width / 2) / width)
                                let opacity = Double(scale)
                                
//                                Button("Jump to #"){
//                                    value.scrollTo(index+1, anchor: .leading)
//                                }
//                                .padding()
                                
                                ZStack(alignment: .top){
                                    VStack{
                                        ZStack{
                                            Text(textosVector[index])
                                                .foregroundColor(.primarycolor)
                                                .font(.custom("Poppins-SemiBold", size: 20))
                                                .multilineTextAlignment(.center)
                                                .padding(.leading, 4)
                                                .padding(.trailing, 4)
                                        }
                                        .frame(width: 240, height: 169)
                                        Spacer()
                                            .frame(maxHeight: 20)
                                        buttonView(selection: $buttonValues[index])
                                            .frame(width: 232, height: 52)
                                            .padding(.leading,24)
                                            .padding(.trailing,24)
                                        
                                    }
                                    .frame(width: 280, height: 380)
                                    .background(Color.secondarycolor)
                                    .cornerRadius(20)
                                    
                                    ZStack {
                                        Circle()
                                            .fill(.secondarycolor)
                                            .stroke(.primarycolor, lineWidth: 2)
                                            .foregroundColor(.secondarycolor)
                                            .frame(width: 64, height: 64)
                                        iconVector[index]
                                            .foregroundColor(.primarycolor)
                                            .font(.system(size: 30))
                                    }
                                    .padding(-32)
                                    
                                    
                                }
                                .frame(width: 280, height: 444)
                                .scaleEffect(scale)
                                .opacity(opacity)
                                .id(index)
                                
                    
                            }
                            .frame(width: 280, height: 444)
                            
                        }
                    }
                    .padding(.horizontal, (width - (width * 0.7)) / 2)
                    .scrollTargetLayout()
                    
                }
                .scrollTargetBehavior(.viewAligned)
            }
            
        }
        .frame(height: 444)
    }
}

#Preview {
    CarrosselView(buttonValues: .constant([-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]))
}
