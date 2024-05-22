//
//  BigButton.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import SwiftUI

struct BigButton: View {
    let title : String
    let action : () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.primary)
                Text(title)
                    .foregroundStyle(.white)
            }
        })
        .frame(height: 50)
        .padding()
    }
}

#Preview {
    BigButton(title: "String", action: {})
}
