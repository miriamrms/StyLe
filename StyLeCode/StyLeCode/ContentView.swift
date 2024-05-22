//
//  ContentView.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 15/05/24.
//

import SwiftUI

struct Estilos{
    var name: String
    var color: Color
    var image: Image
    var description: String
    var percent: Double
    
    init(name: String = "", color: Color = .blue, image: Image = Image(systemName: "info.circle"), description: String = "", percent: Double = 0.0) {
        self.name = name
        self.color = color
        self.image = image
        self.description = description
        self.percent = percent
    }
}

struct ContentView: View {
    @State var buttonStatus: [Int] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
    @State private var showingAlert = false
    @State private var ptAuditivo = 0
    @State private var ptCinestesico = 0
    @State private var ptLeituraEscrita = 0
    @State private var ptVisual = 0
    @State private var ptMaior = 0
    @State private var percent: Double = 0.0
//    @State var estilo = ""
//    @State var estiloDescricao = ""
//    @State var imagemMaior: Image = Image.icon.auditivoIcon
//    @State var estiloColor: Color = .primarycolor
    
    @State private var pressedButton = false
    
    @State private var buttonStrokeColor: Color = .defButton
    @State private var buttonFillColor: Color = .primarycolor
    @State private var buttonTextColor: Color = .defButton
    
    @State private var showPopUp = false
    
    @State private var estilos = Estilos()
    
    
    
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
            if showPopUp{
                PopUpView(isShowing: $showPopUp, estilinho: $estilos)
            }
            
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
        print(buttonStatus)
        if array.contains(-1){
            showPopUp = false
            showingAlert = true
        }
        else
        {
            
            showingAlert = false
            print("Calculo")
            ptAuditivo = buttonStatus[0] + buttonStatus[1] + buttonStatus[2] + buttonStatus[3]
            ptCinestesico = buttonStatus[3] + buttonStatus[4] + buttonStatus[5] + buttonStatus[6]
            ptLeituraEscrita = buttonStatus[7] + buttonStatus[8] + buttonStatus[9] + buttonStatus[10]
            ptVisual = buttonStatus[10] + buttonStatus[11] + buttonStatus[12] + buttonStatus[13]
            
            if ptAuditivo >= ptCinestesico && ptAuditivo >= ptLeituraEscrita && ptAuditivo >= ptVisual{
                ptMaior = ptAuditivo
                estilos.name = "Auditivo"
                estilos.color = .auditivocolor
                estilos.description = "Você aprende melhor ouvindo. Prefere palestras, discussões e gravações de áudio para captar a informação."
                estilos.image = Image.icon.auditivoIcon
            
            }
            
            
            else if ptVisual >= ptAuditivo && ptVisual >= ptCinestesico && ptVisual >= ptLeituraEscrita{
                ptMaior = ptVisual
                estilos.name = "Visual"
                estilos.color = .visualcolor
                estilos.description = "Você aprende melhor através de imagens, gráficos e diagramas. Prefere visualizar a informação para compreendê-la."
                estilos.image = Image.icon.visualIcon
                
            }
            
            else if ptCinestesico >= ptAuditivo && ptCinestesico >= ptVisual && ptCinestesico >= ptLeituraEscrita{
                ptMaior = ptCinestesico
                estilos.name = "Cinestésico"
                estilos.color = .cinestesicocolor
                estilos.description = "Você aprende melhor fazendo e experimentando. Prefere atividades práticas e movimentação para entender a informação."
                estilos.image = Image.icon.cinestesicoIcon
            
            }
            else{
                ptMaior = ptLeituraEscrita
                estilos.name = "Leitura/Escrita"
                estilos.color = .rlcolor
                estilos.description = "Você aprende melhor lendo e escrevendo. Prefere materiais escritos, como livros, anotações e listas, para absorver a informação."
                estilos.image = Image.icon.leituraescritaIcon
                
            }
            estilos.percent = Double( ptMaior)*100/Double((ptVisual+ptAuditivo+ptCinestesico+ptLeituraEscrita))
            
            
            print("Seu estilo predominante é: \(estilos.name) com \(estilos.percent)%")
            print(ptVisual)
            print(ptAuditivo)
            print(ptLeituraEscrita)
            print(ptCinestesico)
            
            showPopUp = true
            
        }
        
        
    }

}


#Preview {
    ContentView()
}
