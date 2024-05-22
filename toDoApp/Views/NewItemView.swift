//
//  NewItemView.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import SwiftUI

struct NewItemView: View {
    @Binding var newItemPresented : Bool
    @StateObject var viewModel = NewItemViewViewModel()
    var body: some View {
        VStack{
            Text("Yeni Görev")
                .font(.title)
                .bold()
                .padding(.top, 100)
            Form{
                TextField("Başlık", text: $viewModel.title)
                DatePicker("Bitiş Tarihi", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BigButton(title: "Kaydet") {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Hata"), message: Text("Lütfen Verilerin Doğruluğunu Kontrol Ediniz"))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
