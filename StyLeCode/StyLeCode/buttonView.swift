//
//  buttonView.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 20/05/24.
//

import SwiftUI

struct buttonView: View {
    @State private var selectedIndex: Int = 2 // Rastreia o índice do botão selecionado
    
    @Binding var selection: Int
    
    private let buttonIcon: [Image] = [Image.icon.notIcon,Image.icon.yesIcon]
    private let buttonSelectedIcon: [Image] = [Image.icon.notPressedIcon,Image.icon.yesPressedIcon]
    var body: some View {
        HStack(spacing:100){
            ForEach(0..<2){ index in
                Button(action: {
                    
                    withAnimation{
                        if selectedIndex != index{
                            selectedIndex = index
                            selection = index
                        } else {
                            selectedIndex = 2
                            selection = -1
                        }
                        
                }
                }){
        
                    if selectedIndex == index{
                        buttonSelectedIcon[index]
                            .foregroundColor(.primarycolor)
                            .font(.system(size: 52))
                        
                    }
                    else{
                        buttonIcon[index]
                            .foregroundColor(.primarycolor)
                            .font(.system(size: 52))
                            
                    }
                
        
                
                }
            }
        }
    }
}

#Preview {
   
    buttonView(selection: .constant(0))
}
