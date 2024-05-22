//
//  RegisterView.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import SwiftUI

struct RegisterView: View {
//    @State var name = ""
//    @State var email = ""
//    @State var password = ""
    
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                //Header Kısmı
                HeaderView()
                //Register Formu
                Form{
                    Section(header: Text("Kayıt Formu")) {
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Tam adınız",text:$viewModel.name)
                            .autocorrectionDisabled()
                        TextField("Email adresiniz",text:$viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Şifreniz",text:$viewModel.password)
                        
                    }
                }.frame(height: 250)
                BigButton(title: "Kayıt Ol", action: {viewModel.register()})
                Spacer()
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
