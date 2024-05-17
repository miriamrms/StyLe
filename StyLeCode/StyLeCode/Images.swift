//
//  Images.swift
//  StyLeCode
//
//  Created by Miriam Rayane Mendes da Silva on 17/05/24.
//

import Foundation
import SwiftUI

extension Image {
    static let icon = Icons()
}

struct Icons{
    
    let auditivoIcon = Image(systemName: "headphones")
    let leituraescritaIcon = Image(systemName: "pencil.and.scribble")
    let cinestesicoIcon = Image(systemName: "hand.raised.fingers.spread")
    let visualIcon = Image(systemName: "eye.fill")
    let questionIcon = Image(systemName: "questionmark")
    
    let notIcon = Image(systemName: "xmark.circle")
    let notPressedIcon = Image(systemName: "xmark.circle.fill")
    
    let yesIcon = Image(systemName: "checkmark.circle")
    let yesPressedIcon = Image(systemName: "checkmark.circle.fill")
    
    let infoIcon = Image(systemName: "info.circle")
    let infoPressedIcon = Image(systemName: "info.circle.fill")
    
    let closeResultIcon = Image(systemName: "xmark.circle")
    let closeResultPressedIcon = Image(systemName: "xmark.circle.fill")
    
}
