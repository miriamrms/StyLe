//
//  PopUpView.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 21/05/24.
//

import SwiftUI

struct PopUpView: View {
    
    @Binding var isShowing: Bool
    @Binding var estilinho: Estilos
    
//    @Binding var estilo: String
//    @Binding var estiloDescricao: String
//    @Binding var imagemMaior: Image
//    @Binding var estiloColor: Color
    
    
    var body: some View {
        ZStack{
            Color.primarycolor
                .ignoresSafeArea()
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            RoundedRectangle(cornerRadius: 20)
                .padding(20)
                .frame(height: 484)
                .foregroundColor(.secondarycolor)
            VStack{
                HStack(){
                    Spacer()
                    Image.icon.closeResultIcon
                        .font(.system(size: 24))
                        .onTapGesture {
                            isShowing = false
                        }
                    
                }
                Text("Seu estilo de aprendizado predominante é")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .padding(.top, 16)

                    
                Text("\(String(format: "%.0f", estilinho.percent))%")
                    .font(.custom("Poppins-Bold", size: 72))
                    .foregroundColor(estilinho.color)
            
                HStack{
                    estilinho.image
                        .font(.system(size: 28))

                    Text(estilinho.name)
                        .font(.custom("Poppins-SemiBold", size: 20))
                    
                }
                Text(estilinho.description)
                    .font(.custom("Poppins-Regular", size: 16))
                    .padding(.top, 12)
            }.padding(56)
                .foregroundColor(.primarycolor)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PopUpView(isShowing: .constant(true), estilinho: .constant(Estilos(name: "dsjnd", color: .blue, image: Image(systemName: "info.circle") , description: "", percent: 0.0)))
}
