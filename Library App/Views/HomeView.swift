//
//  ContentView.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/7/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : BookModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack (alignment: .leading, spacing: 30) {
                    
                    ForEach (model.books) { book in
                        
                        NavigationLink (destination: BookView(book: book)) {
                                BookPreview(book: book)
                                    .padding([.leading, .trailing], 20)
                            }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(BookModel())
    }
}
