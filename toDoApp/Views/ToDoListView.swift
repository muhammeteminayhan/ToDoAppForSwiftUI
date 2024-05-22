//
//  ToDoListView.swift
//  toDoApp
//
//  Created by Muhammet Emin AYHAN on 19.05.2024.
//


import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]

    init(userId : String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Sil"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.blue)
                        }
                    
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Görevler")
            .toolbar{
                Button{
                    // Sheet açma kodları
                    viewModel.showingNewItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItem, content: {
                NewItemView(newItemPresented : $viewModel.showingNewItem)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "atFT78N8suVeTVHb9bFlCBA33Dl2")
}
