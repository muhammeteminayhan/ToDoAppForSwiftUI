//
//  LoginView.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import SwiftUI

struct LoginView: View {
//    @State var email = ""
//    @State var password = ""
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //Header
               HeaderView()
                //Form-email, şifre ve button
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Adresiniz",
                              text:$viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                    SecureField("Password",
                                text:$viewModel.password)
                    
                }
                .frame(height: 200)
                BigButton(title: "Giriş Yap", action: {viewModel.login()})
                Spacer()
                //Footer
                
                VStack{
                    Text("Buralarda yeni misin?")
                    NavigationLink("Yeni Hesap Oluştur", destination: RegisterView())
                }.padding(.bottom, 150)
            }
        }
    }
}

#Preview {
    LoginView()
}
