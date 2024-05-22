//
//  ContentView.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
            
        } else {
            LoginView()
        }
  

    }
    @ViewBuilder
    var accountView : some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Görevler", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
