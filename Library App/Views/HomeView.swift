//
//  ContentView.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/7/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var model = BookModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack (alignment: .leading) {
                    
                    Text("My Library")
                        .font(.largeTitle)
                        .bold()
                    
                    ForEach (model.books) { book in
                        
                        NavigationLink(
                            destination: BookView(book: book),
                            label: {
                                BookPreview(book: book)
                                    .padding()
                            })
                        
                    }
                }
                .padding()
            }
            .environmentObject(model)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
