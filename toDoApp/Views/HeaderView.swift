//
//  HeaderView.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Image("login-icon")
                .resizable()
                .frame(width: 150, height: 150)
            Text("ToDo")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.top, 30)
        }.padding(.top, 100)
    }
}

#Preview {
    HeaderView()
}
