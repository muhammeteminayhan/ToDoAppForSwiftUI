//
//  ToDoListViewViewModel.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel : ObservableObject{
    
    @Published var showingNewItem = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    ///  Delete to do list item
    ///  -Paramater id: Item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
