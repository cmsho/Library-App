//
//  ReadingView.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/9/21.
//

import SwiftUI

struct BookContent: View {
    
    @EnvironmentObject var model:BookModel
    @State var page = 1
    
    var book:Book
    
    var body: some View {
        TabView(selection: $page) {
            
            ForEach(book.content.indices) { index in
                VStack (alignment: .center) {
                    Text(book.content[index])
                        .tag(index)
                    Spacer()
                    Text("\(page + 1)")
                }
                .padding()
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear {
            page = book.currentPage
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        
        BookContent(book: Book())
            .environmentObject(BookModel())
    }
}
