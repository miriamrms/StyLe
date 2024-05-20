//
//  ContentView.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var buttonStatus: [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
    @State private var showingAlert = false
    @State private var ptAuditivo = 0
    @State private var ptCinestesico = 0
    @State private var ptLeituraEscrita = 0
    @State private var ptVisual = 0
    @State private var ptMaior = 0
    @State private var percent: Double = 0.0
    @State private var estilo = ""
    
    
    @State private var pressedButton = false
    
    @State private var buttonStrokeColor: Color = .defButton
    @State private var buttonFillColor: Color = .primarycolor
    @State private var buttonTextColor: Color = .defButton
    
    
    
    var body: some View {
        ZStack(alignment: .top){
            Color.primarycolor
                .ignoresSafeArea()
             
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
                //Textos
                Text("DESCUBRA SEU ESTILO DE APRENDIZADO")
                    .foregroundColor(.secondarycolor)
                    .font(.custom("Poppins-Bold", size: 16))
                    .padding(.top, 48)
                Text("Ao estudar, você costuma:")
                    .foregroundColor(.secondarycolor)
                    .font(.custom("Poppins-Regular", size: 16))
                    .padding(.top, 32)
                    .padding(.bottom, 20)
                
                //Carrossel
                CarrosselView(buttonValues: $buttonStatus)
// .background(isFalse ? (isPressed ? Color.red : Color.green) : (isPressed ? Color.blue: Color.gray))

                //Botão Calcular
                Button(action: {calcular(array: buttonStatus); pressedButton.toggle();updateColor()},
                       label: {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(buttonFillColor)
                            .frame(width: 172, height: 46)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(buttonStrokeColor), lineWidth: 6)
                            )
                        Text("Calcular")
                            .foregroundColor(buttonTextColor)
                            .font(.custom("Poppins-Bold", size: 20))
                    }
                })
                .padding(.top, 20)
                .onChange(of: !buttonStatus.contains(-1)){ newValue in
                    updateColor()
                }
                .alert("Você ainda não selecionou todas opções. Finalize para calcular!", isPresented: $showingAlert) {
                    Button("OK", role: .cancel){}
                }
            }
            .ignoresSafeArea()
        }
    }
    
    func updateColor(){
        if !buttonStatus.contains(-1){
            buttonStrokeColor = .secondarycolor
            buttonFillColor = .primarycolor
            buttonTextColor = .secondarycolor
            if pressedButton{
                buttonFillColor = .secondarycolor
                buttonTextColor = .primarycolor
            }
        }
        else{
            buttonStrokeColor = .defButton
            buttonFillColor = .primarycolor
            buttonTextColor = .defButton
        }
        
    }
    
    func calcular(array: [Int]){
        if array.contains(-1){
            showingAlert = true
        }
        else
        {
            showingAlert = false
            print("Calculo")
            ptAuditivo = buttonStatus[0] + buttonStatus[0] + buttonStatus[0] + buttonStatus[3]
            ptCinestesico = buttonStatus[3] + buttonStatus[4] + buttonStatus[5] + buttonStatus[6]
            ptLeituraEscrita = buttonStatus[7] + buttonStatus[8] + buttonStatus[9] + buttonStatus[10]
            ptVisual = buttonStatus[10] + buttonStatus[11] + buttonStatus[12] + buttonStatus[13]
            
            if ptAuditivo >= ptCinestesico && ptAuditivo >= ptLeituraEscrita && ptAuditivo >= ptVisual{
                ptMaior = ptAuditivo
                estilo = "Auditivo"
            }
            else if ptVisual >= ptAuditivo && ptVisual >= ptCinestesico && ptVisual >= ptLeituraEscrita{
                ptMaior = ptVisual
                estilo = "Visual"
            }
            else if ptCinestesico >= ptAuditivo && ptCinestesico >= ptVisual && ptCinestesico >= ptLeituraEscrita{
                ptMaior = ptCinestesico
                estilo = "Cinestésico"
            }
            else{
                ptMaior = ptLeituraEscrita
                estilo = "Leitura e Escrita"
            }
            
            percent = Double( ptMaior)*100/Double((ptVisual+ptAuditivo+ptCinestesico+ptLeituraEscrita))
            
            print("Seu estilo predominante é: \(estilo) com \(percent)%")
            print(ptVisual)
            print(ptAuditivo)
            print(ptLeituraEscrita)
            print(ptCinestesico)
            
            
        }
    }
}


#Preview {
    ContentView()
}
