//
//  ContentView.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top){
            Color.primarycolor
            VStack(spacing: 0){
                //Safe Area
                Rectangle()
                    .foregroundColor(.secondarycolor)
                    .frame(height: 54)
                //Header
                ZStack(){
                    UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 24, bottomTrailing: 24))
                        .fill(.secondarycolor)
                        .frame(height: 88)
                    Text("StyLe").foregroundColor(.primarycolor)
                        .font(.custom("Merriweather-Black", size: 32))
                }
                Text("DESCUBRA SEU ESTILO DE APRENDIZADO")
                    .foregroundColor(.secondarycolor)
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding(.top, 48)
                Text("Ao estudar, você costuma:")
                    .foregroundColor(.secondarycolor)
                    .font(.custom("Poppins-Regular", size: 16))
                    .padding(.top, 32)
                    .padding(.bottom, 20)
                Rectangle()
                    .frame(height: 444)
                    .padding(.bottom, 28)
                    .foregroundColor(.secondarycolor)
                
                Button(action: {print("Apertou o Botão")}, label: {
                   
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.primarycolor)
                                    .frame(width: 172, height: 46)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.red, lineWidth: 6)
                                    )
                        Text("Calcular")
                        
                    }
                })
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
