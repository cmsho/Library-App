//
//  BookView.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/8/21.
//

import SwiftUI

struct BookView: View {

    var book:Book
    @EnvironmentObject var model:BookModel
    @State private var rating = 3
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            Text("\(book.title)")
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            VStack (alignment: .center, spacing: 10){
                
                Text("Read Now!")
                    .font(.title)
                    .accentColor(.black)
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .padding()
            
            Text("Mark for later!")
                .font(.headline)
            
            
            Button(action: {model.updateFavourite(forId: book.id)}) {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .accentColor(.yellow)
            
            
            Text("Rate \(book.title)")
                .font(.headline)
            
            Picker("Rate this book!", selection: $rating, content: {
                ForEach (1..<6) { index in
                    Text("\(index)").tag(index)
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding([.leading, .trailing, .bottom], 60)
            .onChange(of: rating, perform: { value in
                model.updateRating(forId: book.id, rating: rating)
            })
            
        }
        .onAppear{rating = book.rating}
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = BookModel()
        BookView(book: model.books[1])
            .environmentObject(BookModel())
    }
}
