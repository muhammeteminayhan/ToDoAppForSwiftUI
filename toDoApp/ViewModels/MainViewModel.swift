//
//  MainViewModel.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import FirebaseAuth
import Foundation

class MainViewModel : ObservableObject{
    @Published var currentUserId : String = ""
    
    init(){
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
